; DESCRIPTION: Composite: Places a black dot at position (452, 31) then Creates a white rectangular region at (290, 37) spanning 15 by 92 pixels then Renders a purple disk with center (385, 99) and radius 50.
; PLAN: r0=452(x), r1=31(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=290(x), r6=37(y), r7=15(width), r8=92(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=385(x), r11=99(y), r12=50(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 452
LDI r1, 31
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 290
LDI r6, 37
LDI r7, 15
LDI r8, 92
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 99
LDI r12, 50
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
