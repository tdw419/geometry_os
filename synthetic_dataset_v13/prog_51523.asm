; DESCRIPTION: Composite: Places a black dot at position (55, 22) then Creates a blue rectangular region at (263, 106) spanning 57 by 90 pixels then Draws a green circle centered at (385, 221) with radius 28.
; PLAN: r0=55(x), r1=22(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=263(x), r6=106(y), r7=57(width), r8=90(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=385(x), r11=221(y), r12=28(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 55
LDI r1, 22
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 263
LDI r6, 106
LDI r7, 57
LDI r8, 90
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 221
LDI r12, 28
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
