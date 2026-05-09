; DESCRIPTION: Composite: Places a purple dot at position (292, 5) then Creates a orange rectangular region at (102, 147) spanning 33 by 87 pixels then Renders a red disk with center (303, 154) and radius 69.
; PLAN: r0=292(x), r1=5(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=102(x), r6=147(y), r7=33(width), r8=87(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=303(x), r11=154(y), r12=69(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 292
LDI r1, 5
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 102
LDI r6, 147
LDI r7, 33
LDI r8, 87
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 154
LDI r12, 69
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
