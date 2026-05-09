; DESCRIPTION: Composite: Creates a yellow rectangular region at (295, 109) spanning 78 by 111 pixels then Places a black line segment connecting (83, 153) to (253, 243).
; PLAN: r0=295(x), r1=109(y), r2=78(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=83(x1), r6=153(y1), r7=253(x2), r8=243(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 109
LDI r2, 78
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 153
LDI r7, 253
LDI r8, 243
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
