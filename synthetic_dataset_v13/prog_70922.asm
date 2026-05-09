; DESCRIPTION: Composite: Places a blue line segment connecting (471, 88) to (185, 212) then Renders a black box of size 47x45 starting at (337, 132).
; PLAN: r0=471(x1), r1=88(y1), r2=185(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=132(y), r7=47(width), r8=45(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 471
LDI r1, 88
LDI r2, 185
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 132
LDI r7, 47
LDI r8, 45
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
