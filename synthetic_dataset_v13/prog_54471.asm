; DESCRIPTION: Renders a purple line between points (187, 160) and (15, 109).
; PLAN: r0=187(x1), r1=160(y1), r2=15(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 160
LDI r2, 15
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
