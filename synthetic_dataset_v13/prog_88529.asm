; DESCRIPTION: Places a yellow line segment connecting (309, 63) to (149, 63).
; PLAN: r0=309(x1), r1=63(y1), r2=149(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 63
LDI r2, 149
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
