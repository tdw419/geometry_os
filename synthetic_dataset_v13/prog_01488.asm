; DESCRIPTION: Renders a blue line between points (207, 224) and (407, 193).
; PLAN: r0=207(x1), r1=224(y1), r2=407(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 224
LDI r2, 407
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
