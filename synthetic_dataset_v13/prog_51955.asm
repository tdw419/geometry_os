; DESCRIPTION: Places a magenta line segment connecting (236, 204) to (184, 148).
; PLAN: r0=236(x1), r1=204(y1), r2=184(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 204
LDI r2, 184
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
