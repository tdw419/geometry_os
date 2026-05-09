; DESCRIPTION: Places a cyan line segment connecting (270, 137) to (318, 69).
; PLAN: r0=270(x1), r1=137(y1), r2=318(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 137
LDI r2, 318
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
