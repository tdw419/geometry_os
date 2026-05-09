; DESCRIPTION: Composite: Places a blue dot at position (297, 251) then Creates a blue rectangular region at (292, 66) spanning 103 by 73 pixels then Creates a magenta circular shape at (153, 193) with radius 12.
; PLAN: r0=297(x), r1=251(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=292(x), r6=66(y), r7=103(width), r8=73(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=153(x), r11=193(y), r12=12(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 297
LDI r1, 251
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 292
LDI r6, 66
LDI r7, 103
LDI r8, 73
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 193
LDI r12, 12
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
