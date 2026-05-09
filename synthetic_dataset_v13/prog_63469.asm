; DESCRIPTION: Composite: Places a red dot at position (148, 78) then Creates a yellow rectangular region at (74, 145) spanning 37 by 103 pixels then Renders a cyan disk with center (338, 116) and radius 28.
; PLAN: r0=148(x), r1=78(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=74(x), r6=145(y), r7=37(width), r8=103(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=338(x), r11=116(y), r12=28(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 148
LDI r1, 78
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 74
LDI r6, 145
LDI r7, 37
LDI r8, 103
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 116
LDI r12, 28
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
