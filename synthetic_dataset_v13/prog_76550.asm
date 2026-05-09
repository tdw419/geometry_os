; DESCRIPTION: Composite: Renders a yellow disk with center (61, 68) and radius 39 then Draws a white line from (447, 99) to (56, 174) then Sets a single magenta pixel at (112, 211).
; PLAN: r0=61(x), r1=68(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=447(x1), r6=99(y1), r7=56(x2), r8=174(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=112(x), r11=211(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 61
LDI r1, 68
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 447
LDI r6, 99
LDI r7, 56
LDI r8, 174
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 112
LDI r11, 211
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
