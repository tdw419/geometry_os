; DESCRIPTION: Places a magenta line segment connecting (286, 0) to (386, 85).
; PLAN: r0=286(x1), r1=0(y1), r2=386(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 0
LDI r2, 386
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
