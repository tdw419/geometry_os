; DESCRIPTION: Places a purple line segment connecting (43, 93) to (367, 55).
; PLAN: r0=43(x1), r1=93(y1), r2=367(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 93
LDI r2, 367
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
