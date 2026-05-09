; DESCRIPTION: Draws a cyan line from (62, 172) to (49, 205).
; PLAN: r0=62(x1), r1=172(y1), r2=49(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 172
LDI r2, 49
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
