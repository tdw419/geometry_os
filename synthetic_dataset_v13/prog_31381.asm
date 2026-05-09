; DESCRIPTION: Places a cyan line segment connecting (130, 233) to (325, 110).
; PLAN: r0=130(x1), r1=233(y1), r2=325(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 233
LDI r2, 325
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
