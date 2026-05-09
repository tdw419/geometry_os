; DESCRIPTION: Places a cyan line segment connecting (7, 123) to (441, 155).
; PLAN: r0=7(x1), r1=123(y1), r2=441(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 123
LDI r2, 441
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
