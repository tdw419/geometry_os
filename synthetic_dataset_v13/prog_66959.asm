; DESCRIPTION: Renders a purple line between points (102, 194) and (106, 195).
; PLAN: r0=102(x1), r1=194(y1), r2=106(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 194
LDI r2, 106
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
