; DESCRIPTION: Places a cyan line segment connecting (179, 220) to (376, 110).
; PLAN: r0=179(x1), r1=220(y1), r2=376(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 220
LDI r2, 376
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
