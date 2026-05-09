; DESCRIPTION: Places a magenta line segment connecting (138, 150) to (352, 118).
; PLAN: r0=138(x1), r1=150(y1), r2=352(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 150
LDI r2, 352
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
