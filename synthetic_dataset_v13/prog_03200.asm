; DESCRIPTION: Composite: Sets a single black pixel at (119, 178) then Creates a cyan rectangular region at (36, 121) spanning 22 by 120 pixels then Renders a magenta disk with center (258, 184) and radius 39.
; PLAN: r0=119(x), r1=178(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=36(x), r6=121(y), r7=22(width), r8=120(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=258(x), r11=184(y), r12=39(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 119
LDI r1, 178
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 36
LDI r6, 121
LDI r7, 22
LDI r8, 120
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 184
LDI r12, 39
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
