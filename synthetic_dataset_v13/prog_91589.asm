; DESCRIPTION: Places a black line segment connecting (357, 188) to (63, 166).
; PLAN: r0=357(x1), r1=188(y1), r2=63(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 188
LDI r2, 63
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
