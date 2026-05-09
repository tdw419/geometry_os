; DESCRIPTION: Places a orange line segment connecting (326, 254) to (207, 231).
; PLAN: r0=326(x1), r1=254(y1), r2=207(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 254
LDI r2, 207
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
