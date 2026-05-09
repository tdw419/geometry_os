; DESCRIPTION: Places a magenta line segment connecting (352, 168) to (115, 175).
; PLAN: r0=352(x1), r1=168(y1), r2=115(x2), r3=175(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 168
LDI r2, 115
LDI r3, 175
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
