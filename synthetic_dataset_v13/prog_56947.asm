; DESCRIPTION: Composite: Places a blue dot at position (312, 52) then Renders a magenta line between points (323, 53) and (425, 224) then Creates a magenta circular shape at (169, 69) with radius 49.
; PLAN: r0=312(x), r1=52(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=323(x1), r6=53(y1), r7=425(x2), r8=224(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=169(x), r11=69(y), r12=49(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 312
LDI r1, 52
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 323
LDI r6, 53
LDI r7, 425
LDI r8, 224
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 169
LDI r11, 69
LDI r12, 49
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
