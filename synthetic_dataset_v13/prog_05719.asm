; DESCRIPTION: Composite: Renders a magenta box of size 33x62 starting at (51, 70) then Draws a orange line from (390, 107) to (271, 216).
; PLAN: r0=51(x), r1=70(y), r2=33(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=390(x1), r6=107(y1), r7=271(x2), r8=216(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 51
LDI r1, 70
LDI r2, 33
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 107
LDI r7, 271
LDI r8, 216
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
