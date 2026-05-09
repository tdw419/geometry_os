; DESCRIPTION: Composite: Creates a blue circular shape at (186, 134) with radius 31 then Sets a single blue pixel at (315, 25) then Places a cyan 50x28 rectangle at position (116, 80).
; PLAN: r0=186(x), r1=134(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=315(x), r6=25(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=116(x), r11=80(y), r12=50(width), r13=28(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 186
LDI r1, 134
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 315
LDI r6, 25
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 116
LDI r11, 80
LDI r12, 50
LDI r13, 28
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
