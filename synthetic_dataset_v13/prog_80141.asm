; DESCRIPTION: Renders a red line between points (224, 250) and (162, 66).
; PLAN: r0=224(x1), r1=250(y1), r2=162(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 250
LDI r2, 162
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
