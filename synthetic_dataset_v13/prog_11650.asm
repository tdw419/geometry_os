; DESCRIPTION: Composite: Places a yellow dot at position (111, 207) then Creates a red rectangular region at (74, 28) spanning 39 by 104 pixels then Creates a purple circular shape at (407, 120) with radius 45.
; PLAN: r0=111(x), r1=207(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=74(x), r6=28(y), r7=39(width), r8=104(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=407(x), r11=120(y), r12=45(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 111
LDI r1, 207
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 74
LDI r6, 28
LDI r7, 39
LDI r8, 104
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 120
LDI r12, 45
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
