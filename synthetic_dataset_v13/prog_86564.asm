; DESCRIPTION: Places a cyan line segment connecting (2, 198) to (331, 101).
; PLAN: r0=2(x1), r1=198(y1), r2=331(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 198
LDI r2, 331
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
