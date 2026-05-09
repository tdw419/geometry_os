; DESCRIPTION: Composite: Places a yellow dot at position (96, 62) then Creates a green circular shape at (420, 109) with radius 63 then Places a white 68x18 rectangle at position (46, 237).
; PLAN: r0=96(x), r1=62(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=420(x), r6=109(y), r7=63(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=46(x), r11=237(y), r12=68(width), r13=18(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 62
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 420
LDI r6, 109
LDI r7, 63
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 46
LDI r11, 237
LDI r12, 68
LDI r13, 18
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
