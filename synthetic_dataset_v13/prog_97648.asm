; DESCRIPTION: Places a black line segment connecting (296, 86) to (335, 127).
; PLAN: r0=296(x1), r1=86(y1), r2=335(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 86
LDI r2, 335
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
