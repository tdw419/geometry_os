; DESCRIPTION: Composite: Renders a magenta disk with center (451, 118) and radius 56 then Renders a white line between points (323, 69) and (315, 231).
; PLAN: r0=451(x), r1=118(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x1), r6=69(y1), r7=315(x2), r8=231(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 118
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 69
LDI r7, 315
LDI r8, 231
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
