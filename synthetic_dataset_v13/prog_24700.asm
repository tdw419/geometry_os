; DESCRIPTION: Places a purple line segment connecting (60, 138) to (183, 55).
; PLAN: r0=60(x1), r1=138(y1), r2=183(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 138
LDI r2, 183
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
