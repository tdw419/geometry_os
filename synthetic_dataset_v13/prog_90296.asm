; DESCRIPTION: Draws a green line from (297, 184) to (89, 231).
; PLAN: r0=297(x1), r1=184(y1), r2=89(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 184
LDI r2, 89
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
