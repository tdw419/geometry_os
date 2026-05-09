; DESCRIPTION: Places a magenta line segment connecting (406, 149) to (0, 51).
; PLAN: r0=406(x1), r1=149(y1), r2=0(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 149
LDI r2, 0
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
