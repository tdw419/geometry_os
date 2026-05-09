; DESCRIPTION: Places a red line segment connecting (224, 118) to (36, 86).
; PLAN: r0=224(x1), r1=118(y1), r2=36(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 118
LDI r2, 36
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
