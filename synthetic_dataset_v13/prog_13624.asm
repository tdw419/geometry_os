; DESCRIPTION: Places a yellow line segment connecting (120, 31) to (136, 236).
; PLAN: r0=120(x1), r1=31(y1), r2=136(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 31
LDI r2, 136
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
