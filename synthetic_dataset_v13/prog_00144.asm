; DESCRIPTION: Places a yellow line segment connecting (62, 152) to (166, 133).
; PLAN: r0=62(x1), r1=152(y1), r2=166(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 152
LDI r2, 166
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
