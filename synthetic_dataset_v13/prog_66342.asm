; DESCRIPTION: Places a orange line segment connecting (180, 188) to (384, 231).
; PLAN: r0=180(x1), r1=188(y1), r2=384(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 188
LDI r2, 384
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
