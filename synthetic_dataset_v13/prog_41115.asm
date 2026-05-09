; DESCRIPTION: Renders a green line between points (224, 122) and (423, 47).
; PLAN: r0=224(x1), r1=122(y1), r2=423(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 122
LDI r2, 423
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
