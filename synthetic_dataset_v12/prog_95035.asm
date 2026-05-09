; DESCRIPTION: Places a blue line segment connecting (207, 140) to (352, 124).
; PLAN: r0=207(x1), r1=140(y1), r2=352(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 140
LDI r2, 352
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
