; DESCRIPTION: Renders a purple line between points (156, 91) and (160, 36).
; PLAN: r0=156(x1), r1=91(y1), r2=160(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 91
LDI r2, 160
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
