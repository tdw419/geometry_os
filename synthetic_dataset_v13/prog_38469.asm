; DESCRIPTION: Renders a orange line between points (251, 207) and (326, 198).
; PLAN: r0=251(x1), r1=207(y1), r2=326(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 207
LDI r2, 326
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
