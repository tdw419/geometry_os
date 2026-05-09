; DESCRIPTION: Places a orange line segment connecting (231, 71) to (455, 197).
; PLAN: r0=231(x1), r1=71(y1), r2=455(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 71
LDI r2, 455
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
