; DESCRIPTION: Renders a yellow line between points (341, 165) and (224, 39).
; PLAN: r0=341(x1), r1=165(y1), r2=224(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 165
LDI r2, 224
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
