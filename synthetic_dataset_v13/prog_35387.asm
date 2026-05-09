; DESCRIPTION: Places a white line segment connecting (509, 169) to (64, 108).
; PLAN: r0=509(x1), r1=169(y1), r2=64(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 169
LDI r2, 64
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
