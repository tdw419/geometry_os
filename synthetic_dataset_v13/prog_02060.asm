; DESCRIPTION: Composite: Renders a orange box of size 95x100 starting at (351, 7) then Renders a cyan line between points (358, 180) and (432, 125) then Renders a blue disk with center (239, 74) and radius 55.
; PLAN: r0=351(x), r1=7(y), r2=95(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x1), r6=180(y1), r7=432(x2), r8=125(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=239(x), r11=74(y), r12=55(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 351
LDI r1, 7
LDI r2, 95
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 180
LDI r7, 432
LDI r8, 125
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 74
LDI r12, 55
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
