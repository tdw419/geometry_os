; DESCRIPTION: Draws a green line from (357, 8) to (345, 237).
; PLAN: r0=357(x1), r1=8(y1), r2=345(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 8
LDI r2, 345
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
