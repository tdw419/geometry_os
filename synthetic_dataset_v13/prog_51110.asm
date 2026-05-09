; DESCRIPTION: Renders a purple line between points (91, 30) and (70, 171).
; PLAN: r0=91(x1), r1=30(y1), r2=70(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 30
LDI r2, 70
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
