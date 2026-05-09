; DESCRIPTION: Places a magenta line segment connecting (143, 162) to (161, 70).
; PLAN: r0=143(x1), r1=162(y1), r2=161(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 162
LDI r2, 161
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
