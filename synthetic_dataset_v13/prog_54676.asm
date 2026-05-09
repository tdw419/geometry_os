; DESCRIPTION: Renders a yellow line between points (406, 149) and (224, 98).
; PLAN: r0=406(x1), r1=149(y1), r2=224(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 149
LDI r2, 224
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
