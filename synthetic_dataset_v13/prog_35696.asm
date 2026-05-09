; DESCRIPTION: Draws a yellow line from (484, 16) to (224, 136).
; PLAN: r0=484(x1), r1=16(y1), r2=224(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 16
LDI r2, 224
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
