; DESCRIPTION: Renders a white line between points (224, 198) and (270, 138).
; PLAN: r0=224(x1), r1=198(y1), r2=270(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 198
LDI r2, 270
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
