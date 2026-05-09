; DESCRIPTION: Places a yellow line segment connecting (74, 255) to (199, 189).
; PLAN: r0=74(x1), r1=255(y1), r2=199(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 255
LDI r2, 199
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
