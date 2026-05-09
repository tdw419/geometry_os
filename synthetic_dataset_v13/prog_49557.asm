; DESCRIPTION: Draws a blue line from (341, 44) to (224, 99).
; PLAN: r0=341(x1), r1=44(y1), r2=224(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 44
LDI r2, 224
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
