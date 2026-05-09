; DESCRIPTION: Places a orange line segment connecting (29, 197) to (117, 90).
; PLAN: r0=29(x1), r1=197(y1), r2=117(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 197
LDI r2, 117
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
