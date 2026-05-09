; DESCRIPTION: Draws a orange line from (439, 231) to (67, 66).
; PLAN: r0=439(x1), r1=231(y1), r2=67(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 231
LDI r2, 67
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
