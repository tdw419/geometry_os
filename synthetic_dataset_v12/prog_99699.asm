; DESCRIPTION: Places a cyan line segment connecting (251, 53) to (455, 123).
; PLAN: r0=251(x1), r1=53(y1), r2=455(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 53
LDI r2, 455
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
