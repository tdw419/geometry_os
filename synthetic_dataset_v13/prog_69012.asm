; DESCRIPTION: Composite: Places a purple dot at position (260, 52) then Creates a green circular shape at (127, 215) with radius 37 then Places a purple 83x88 rectangle at position (215, 18).
; PLAN: r0=260(x), r1=52(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=215(y), r7=37(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=215(x), r11=18(y), r12=83(width), r13=88(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 52
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 127
LDI r6, 215
LDI r7, 37
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 215
LDI r11, 18
LDI r12, 83
LDI r13, 88
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
