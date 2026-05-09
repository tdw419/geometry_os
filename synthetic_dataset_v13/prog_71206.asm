; DESCRIPTION: Renders a purple line between points (207, 26) and (105, 150).
; PLAN: r0=207(x1), r1=26(y1), r2=105(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 26
LDI r2, 105
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
