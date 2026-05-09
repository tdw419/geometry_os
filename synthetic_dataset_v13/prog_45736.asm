; DESCRIPTION: Composite: Draws a orange circle centered at (255, 107) with radius 74 then Renders a magenta line between points (112, 56) and (319, 4).
; PLAN: r0=255(x), r1=107(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=112(x1), r6=56(y1), r7=319(x2), r8=4(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 107
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 112
LDI r6, 56
LDI r7, 319
LDI r8, 4
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
