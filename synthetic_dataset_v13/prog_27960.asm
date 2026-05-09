; DESCRIPTION: Places a magenta line segment connecting (449, 210) to (35, 162).
; PLAN: r0=449(x1), r1=210(y1), r2=35(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 210
LDI r2, 35
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
