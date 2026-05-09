; DESCRIPTION: Renders a blue line between points (80, 39) and (224, 14).
; PLAN: r0=80(x1), r1=39(y1), r2=224(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 39
LDI r2, 224
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
