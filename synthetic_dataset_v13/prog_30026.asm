; DESCRIPTION: Places a cyan line segment connecting (423, 85) to (110, 63).
; PLAN: r0=423(x1), r1=85(y1), r2=110(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 85
LDI r2, 110
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
