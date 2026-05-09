; DESCRIPTION: Places a magenta line segment connecting (407, 187) to (233, 69).
; PLAN: r0=407(x1), r1=187(y1), r2=233(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 187
LDI r2, 233
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
