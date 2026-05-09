; DESCRIPTION: Draws a orange line from (297, 161) to (326, 126).
; PLAN: r0=297(x1), r1=161(y1), r2=326(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 161
LDI r2, 326
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
