; DESCRIPTION: Composite: Places a yellow dot at position (23, 116) then Renders a red box of size 58x10 starting at (185, 7) then Creates a red circular shape at (274, 227) with radius 20.
; PLAN: r0=23(x), r1=116(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=185(x), r6=7(y), r7=58(width), r8=10(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=274(x), r11=227(y), r12=20(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 23
LDI r1, 116
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 185
LDI r6, 7
LDI r7, 58
LDI r8, 10
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 227
LDI r12, 20
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
