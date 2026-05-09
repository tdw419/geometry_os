; DESCRIPTION: Renders a purple line between points (224, 19) and (146, 6).
; PLAN: r0=224(x1), r1=19(y1), r2=146(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 19
LDI r2, 146
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
