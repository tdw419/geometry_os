; DESCRIPTION: Renders a orange line between points (163, 193) and (224, 213).
; PLAN: r0=163(x1), r1=193(y1), r2=224(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 193
LDI r2, 224
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
