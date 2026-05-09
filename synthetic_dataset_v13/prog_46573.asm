; DESCRIPTION: Composite: Renders a white line between points (250, 89) and (390, 52) then Renders a orange box of size 104x94 starting at (35, 153).
; PLAN: r0=250(x1), r1=89(y1), r2=390(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=35(x), r6=153(y), r7=104(width), r8=94(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 250
LDI r1, 89
LDI r2, 390
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 153
LDI r7, 104
LDI r8, 94
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
