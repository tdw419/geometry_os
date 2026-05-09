; DESCRIPTION: Draws a green line from (224, 46) to (130, 185).
; PLAN: r0=224(x1), r1=46(y1), r2=130(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 46
LDI r2, 130
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
