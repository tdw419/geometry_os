; DESCRIPTION: Composite: Draws a magenta line from (57, 201) to (382, 190) then Renders a black disk with center (218, 83) and radius 62.
; PLAN: r0=57(x1), r1=201(y1), r2=382(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=83(y), r7=62(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 57
LDI r1, 201
LDI r2, 382
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 83
LDI r7, 62
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
