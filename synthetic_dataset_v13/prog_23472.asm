; DESCRIPTION: Places a white line segment connecting (160, 169) to (283, 168).
; PLAN: r0=160(x1), r1=169(y1), r2=283(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 169
LDI r2, 283
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
