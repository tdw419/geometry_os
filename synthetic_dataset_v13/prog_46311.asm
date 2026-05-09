; DESCRIPTION: Places a magenta line segment connecting (233, 69) to (6, 138).
; PLAN: r0=233(x1), r1=69(y1), r2=6(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 69
LDI r2, 6
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
