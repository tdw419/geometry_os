; DESCRIPTION: Renders a red line between points (76, 110) and (224, 101).
; PLAN: r0=76(x1), r1=110(y1), r2=224(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 110
LDI r2, 224
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
