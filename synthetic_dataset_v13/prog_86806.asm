; DESCRIPTION: Composite: Sets a single purple pixel at (264, 43) then Renders a white line between points (154, 62) and (337, 253) then Draws a yellow circle centered at (99, 39) with radius 25.
; PLAN: r0=264(x), r1=43(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=154(x1), r6=62(y1), r7=337(x2), r8=253(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=99(x), r11=39(y), r12=25(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 264
LDI r1, 43
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 154
LDI r6, 62
LDI r7, 337
LDI r8, 253
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 39
LDI r12, 25
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
