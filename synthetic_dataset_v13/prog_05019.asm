; DESCRIPTION: Draws a green line from (46, 237) to (357, 122).
; PLAN: r0=46(x1), r1=237(y1), r2=357(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 237
LDI r2, 357
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
