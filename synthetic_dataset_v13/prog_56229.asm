; DESCRIPTION: Places a cyan line segment connecting (331, 123) to (1, 76).
; PLAN: r0=331(x1), r1=123(y1), r2=1(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 123
LDI r2, 1
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
