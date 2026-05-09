; DESCRIPTION: Places a cyan line segment connecting (119, 137) to (108, 2).
; PLAN: r0=119(x1), r1=137(y1), r2=108(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 137
LDI r2, 108
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
