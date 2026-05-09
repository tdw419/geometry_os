; DESCRIPTION: Composite: Renders a magenta line between points (19, 247) and (370, 13) then Creates a blue circular shape at (205, 174) with radius 22.
; PLAN: r0=19(x1), r1=247(y1), r2=370(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=174(y), r7=22(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 19
LDI r1, 247
LDI r2, 370
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 174
LDI r7, 22
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
