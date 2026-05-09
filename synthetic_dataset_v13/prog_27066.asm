; DESCRIPTION: Places a magenta line segment connecting (416, 82) to (379, 227).
; PLAN: r0=416(x1), r1=82(y1), r2=379(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 82
LDI r2, 379
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
