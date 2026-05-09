; DESCRIPTION: Places a orange line segment connecting (191, 217) to (479, 231).
; PLAN: r0=191(x1), r1=217(y1), r2=479(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 217
LDI r2, 479
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
