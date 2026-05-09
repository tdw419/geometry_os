; DESCRIPTION: Composite: Renders a blue line between points (451, 246) and (17, 244) then Places a white 20x77 rectangle at position (55, 74) then Sets a single yellow pixel at (68, 8).
; PLAN: r0=451(x1), r1=246(y1), r2=17(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=55(x), r6=74(y), r7=20(width), r8=77(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=68(x), r11=8(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 451
LDI r1, 246
LDI r2, 17
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 74
LDI r7, 20
LDI r8, 77
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 8
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
