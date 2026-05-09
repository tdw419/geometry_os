; DESCRIPTION: Composite: Renders a orange box of size 88x93 starting at (358, 159) then Renders a white line between points (393, 77) and (385, 225) then Renders a black disk with center (111, 140) and radius 12.
; PLAN: r0=358(x), r1=159(y), r2=88(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=393(x1), r6=77(y1), r7=385(x2), r8=225(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=111(x), r11=140(y), r12=12(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 358
LDI r1, 159
LDI r2, 88
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 77
LDI r7, 385
LDI r8, 225
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 140
LDI r12, 12
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
