; DESCRIPTION: Places a cyan line segment connecting (492, 160) to (468, 129).
; PLAN: r0=492(x1), r1=160(y1), r2=468(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 160
LDI r2, 468
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
