; DESCRIPTION: Places a cyan line segment connecting (318, 211) to (115, 31).
; PLAN: r0=318(x1), r1=211(y1), r2=115(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 211
LDI r2, 115
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
