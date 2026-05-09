; DESCRIPTION: Places a magenta line segment connecting (192, 143) to (403, 100).
; PLAN: r0=192(x1), r1=143(y1), r2=403(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 143
LDI r2, 403
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
