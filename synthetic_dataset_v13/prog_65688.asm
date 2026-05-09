; DESCRIPTION: Places a blue line segment connecting (268, 226) to (159, 115).
; PLAN: r0=268(x1), r1=226(y1), r2=159(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 226
LDI r2, 159
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
