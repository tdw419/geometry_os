; DESCRIPTION: Places a cyan line segment connecting (312, 114) to (208, 229).
; PLAN: r0=312(x1), r1=114(y1), r2=208(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 114
LDI r2, 208
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
