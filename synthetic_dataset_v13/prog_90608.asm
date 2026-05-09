; DESCRIPTION: Places a cyan line segment connecting (314, 58) to (217, 137).
; PLAN: r0=314(x1), r1=58(y1), r2=217(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 58
LDI r2, 217
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
