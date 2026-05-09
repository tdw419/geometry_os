; DESCRIPTION: Composite: Places a black dot at position (471, 24) then Renders a red box of size 58x74 starting at (80, 69) then Renders a green disk with center (428, 109) and radius 78.
; PLAN: r0=471(x), r1=24(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=69(y), r7=58(width), r8=74(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=428(x), r11=109(y), r12=78(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 471
LDI r1, 24
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 80
LDI r6, 69
LDI r7, 58
LDI r8, 74
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 109
LDI r12, 78
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
