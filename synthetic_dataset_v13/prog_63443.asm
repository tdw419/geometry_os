; DESCRIPTION: Draws a yellow line from (224, 98) to (30, 78).
; PLAN: r0=224(x1), r1=98(y1), r2=30(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 98
LDI r2, 30
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
