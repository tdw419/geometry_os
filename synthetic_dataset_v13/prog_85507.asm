; DESCRIPTION: Draws a green line from (250, 130) to (203, 32).
; PLAN: r0=250(x1), r1=130(y1), r2=203(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 130
LDI r2, 203
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
