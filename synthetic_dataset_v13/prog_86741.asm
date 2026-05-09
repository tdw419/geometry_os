; DESCRIPTION: Renders a blue line between points (56, 91) and (224, 50).
; PLAN: r0=56(x1), r1=91(y1), r2=224(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 91
LDI r2, 224
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
