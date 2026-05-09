; DESCRIPTION: Places a cyan line segment connecting (137, 59) to (427, 66).
; PLAN: r0=137(x1), r1=59(y1), r2=427(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 59
LDI r2, 427
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
