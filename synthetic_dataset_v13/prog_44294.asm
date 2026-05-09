; DESCRIPTION: Renders a yellow line between points (224, 220) and (249, 130).
; PLAN: r0=224(x1), r1=220(y1), r2=249(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 220
LDI r2, 249
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
