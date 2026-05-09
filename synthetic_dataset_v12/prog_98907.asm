; DESCRIPTION: Composite: Places a blue dot at position (468, 65) then Creates a blue rectangular region at (267, 123) spanning 45 by 100 pixels then Renders a magenta disk with center (270, 90) and radius 80.
; PLAN: r0=468(x), r1=65(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=267(x), r6=123(y), r7=45(width), r8=100(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=270(x), r11=90(y), r12=80(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 468
LDI r1, 65
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 267
LDI r6, 123
LDI r7, 45
LDI r8, 100
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 90
LDI r12, 80
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
