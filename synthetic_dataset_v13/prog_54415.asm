; DESCRIPTION: Draws a yellow line from (382, 224) to (68, 2).
; PLAN: r0=382(x1), r1=224(y1), r2=68(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 224
LDI r2, 68
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
