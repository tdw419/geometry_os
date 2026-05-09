; DESCRIPTION: Renders a green line between points (315, 224) and (225, 99).
; PLAN: r0=315(x1), r1=224(y1), r2=225(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 224
LDI r2, 225
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
