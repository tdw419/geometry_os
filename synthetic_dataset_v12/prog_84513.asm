; DESCRIPTION: Places a magenta line segment connecting (331, 118) to (352, 93).
; PLAN: r0=331(x1), r1=118(y1), r2=352(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 118
LDI r2, 352
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
