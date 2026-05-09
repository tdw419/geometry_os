; DESCRIPTION: Draws a yellow line from (87, 22) to (224, 145).
; PLAN: r0=87(x1), r1=22(y1), r2=224(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 22
LDI r2, 224
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
