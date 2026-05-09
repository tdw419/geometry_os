; DESCRIPTION: Places a magenta line segment connecting (403, 184) to (417, 121).
; PLAN: r0=403(x1), r1=184(y1), r2=417(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 184
LDI r2, 417
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
