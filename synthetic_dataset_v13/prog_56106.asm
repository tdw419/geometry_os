; DESCRIPTION: Composite: Places a purple circle of radius 25 at center (337, 224) then Renders a magenta line between points (335, 11) and (5, 156).
; PLAN: r0=337(x), r1=224(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=335(x1), r6=11(y1), r7=5(x2), r8=156(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 224
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 335
LDI r6, 11
LDI r7, 5
LDI r8, 156
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
