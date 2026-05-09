; DESCRIPTION: Renders a purple line between points (174, 159) and (65, 76).
; PLAN: r0=174(x1), r1=159(y1), r2=65(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 159
LDI r2, 65
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
