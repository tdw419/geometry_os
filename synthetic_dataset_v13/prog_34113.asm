; DESCRIPTION: Places a yellow line segment connecting (86, 79) to (63, 39).
; PLAN: r0=86(x1), r1=79(y1), r2=63(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 79
LDI r2, 63
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
