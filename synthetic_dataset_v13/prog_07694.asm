; DESCRIPTION: Places a magenta line segment connecting (208, 149) to (182, 61).
; PLAN: r0=208(x1), r1=149(y1), r2=182(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 149
LDI r2, 182
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
