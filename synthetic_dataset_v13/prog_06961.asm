; DESCRIPTION: Renders a yellow line between points (224, 139) and (436, 236).
; PLAN: r0=224(x1), r1=139(y1), r2=436(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 139
LDI r2, 436
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
