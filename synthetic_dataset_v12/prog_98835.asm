; DESCRIPTION: Places a cyan line segment connecting (229, 115) to (287, 185).
; PLAN: r0=229(x1), r1=115(y1), r2=287(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 115
LDI r2, 287
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
