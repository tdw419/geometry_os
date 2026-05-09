; DESCRIPTION: Renders a yellow line between points (224, 224) and (360, 37).
; PLAN: r0=224(x1), r1=224(y1), r2=360(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 224
LDI r2, 360
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
