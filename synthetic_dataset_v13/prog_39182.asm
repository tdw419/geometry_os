; DESCRIPTION: Draws a green line from (46, 157) to (200, 106).
; PLAN: r0=46(x1), r1=157(y1), r2=200(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 157
LDI r2, 200
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
