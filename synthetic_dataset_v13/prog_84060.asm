; DESCRIPTION: Draws a green line from (357, 212) to (78, 32).
; PLAN: r0=357(x1), r1=212(y1), r2=78(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 212
LDI r2, 78
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
