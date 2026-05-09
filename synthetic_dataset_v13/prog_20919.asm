; DESCRIPTION: Renders a orange line between points (241, 231) and (30, 94).
; PLAN: r0=241(x1), r1=231(y1), r2=30(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 231
LDI r2, 30
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
