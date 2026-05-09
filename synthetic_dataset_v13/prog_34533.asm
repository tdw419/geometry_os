; DESCRIPTION: Places a cyan line segment connecting (325, 96) to (312, 156).
; PLAN: r0=325(x1), r1=96(y1), r2=312(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 96
LDI r2, 312
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
