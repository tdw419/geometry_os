; DESCRIPTION: Places a cyan line segment connecting (310, 169) to (144, 34).
; PLAN: r0=310(x1), r1=169(y1), r2=144(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 169
LDI r2, 144
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
