; DESCRIPTION: Places a white line segment connecting (283, 133) to (124, 206).
; PLAN: r0=283(x1), r1=133(y1), r2=124(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 133
LDI r2, 124
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
