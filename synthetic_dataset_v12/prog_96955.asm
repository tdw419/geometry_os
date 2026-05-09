; DESCRIPTION: Places a cyan line segment connecting (85, 69) to (261, 97).
; PLAN: r0=85(x1), r1=69(y1), r2=261(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 69
LDI r2, 261
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
