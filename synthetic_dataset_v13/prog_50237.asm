; DESCRIPTION: Renders a purple line between points (66, 168) and (302, 107).
; PLAN: r0=66(x1), r1=168(y1), r2=302(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 168
LDI r2, 302
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
