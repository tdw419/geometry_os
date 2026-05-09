; DESCRIPTION: Places a red line segment connecting (283, 144) to (115, 160).
; PLAN: r0=283(x1), r1=144(y1), r2=115(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 144
LDI r2, 115
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
