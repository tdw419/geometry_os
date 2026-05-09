; DESCRIPTION: Composite: Places a magenta dot at position (57, 178) then Creates a green circular shape at (439, 52) with radius 49 then Places a green 38x59 rectangle at position (461, 147).
; PLAN: r0=57(x), r1=178(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=439(x), r6=52(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=461(x), r11=147(y), r12=38(width), r13=59(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 178
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 439
LDI r6, 52
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 461
LDI r11, 147
LDI r12, 38
LDI r13, 59
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
