; DESCRIPTION: Places a magenta line segment connecting (166, 46) to (477, 233).
; PLAN: r0=166(x1), r1=46(y1), r2=477(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 46
LDI r2, 477
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
