; DESCRIPTION: Places a magenta line segment connecting (4, 161) to (57, 193).
; PLAN: r0=4(x1), r1=161(y1), r2=57(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 161
LDI r2, 57
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
