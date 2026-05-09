; DESCRIPTION: Composite: Places a purple circle of radius 72 at center (267, 169) then Creates a blue rectangular region at (36, 160) spanning 100 by 65 pixels.
; PLAN: r0=267(x), r1=169(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=36(x), r6=160(y), r7=100(width), r8=65(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 267
LDI r1, 169
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 36
LDI r6, 160
LDI r7, 100
LDI r8, 65
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
