; DESCRIPTION: Places a magenta line segment connecting (184, 142) to (407, 38).
; PLAN: r0=184(x1), r1=142(y1), r2=407(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 142
LDI r2, 407
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
