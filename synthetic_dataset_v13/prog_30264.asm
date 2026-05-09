; DESCRIPTION: Composite: Renders a black disk with center (338, 65) and radius 37 then Renders a orange line between points (322, 248) and (23, 244) then Places a black 60x70 rectangle at position (426, 45).
; PLAN: r0=338(x), r1=65(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x1), r6=248(y1), r7=23(x2), r8=244(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=426(x), r11=45(y), r12=60(width), r13=70(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 65
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 248
LDI r7, 23
LDI r8, 244
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 45
LDI r12, 60
LDI r13, 70
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
