; DESCRIPTION: Draws a green line from (117, 123) to (89, 94).
; PLAN: r0=117(x1), r1=123(y1), r2=89(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 123
LDI r2, 89
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
