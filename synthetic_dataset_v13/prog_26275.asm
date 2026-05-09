; DESCRIPTION: Composite: Renders a blue line between points (33, 94) and (51, 70) then Renders a green box of size 85x69 starting at (272, 88).
; PLAN: r0=33(x1), r1=94(y1), r2=51(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=88(y), r7=85(width), r8=69(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 33
LDI r1, 94
LDI r2, 51
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 88
LDI r7, 85
LDI r8, 69
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
