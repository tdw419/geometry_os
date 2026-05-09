; DESCRIPTION: Composite: Draws a orange rectangle at (185, 157) with width 31 and height 14 then Sets a single blue pixel at (3, 151) then Renders a purple line between points (477, 124) and (435, 48).
; PLAN: r0=185(x), r1=157(y), r2=31(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=3(x), r6=151(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=477(x1), r11=124(y1), r12=435(x2), r13=48(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 185
LDI r1, 157
LDI r2, 31
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 151
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 477
LDI r11, 124
LDI r12, 435
LDI r13, 48
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
