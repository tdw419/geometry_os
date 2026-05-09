; DESCRIPTION: Draws a green line from (456, 31) to (176, 245).
; PLAN: r0=456(x1), r1=31(y1), r2=176(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 31
LDI r2, 176
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
