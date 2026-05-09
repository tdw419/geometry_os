; DESCRIPTION: Places a cyan line segment connecting (390, 24) to (177, 155).
; PLAN: r0=390(x1), r1=24(y1), r2=177(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 24
LDI r2, 177
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
