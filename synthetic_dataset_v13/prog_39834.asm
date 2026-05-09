; DESCRIPTION: Renders a orange line between points (224, 194) and (132, 202).
; PLAN: r0=224(x1), r1=194(y1), r2=132(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 194
LDI r2, 132
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
