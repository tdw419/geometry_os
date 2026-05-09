; DESCRIPTION: Composite: Sets a single red pixel at (30, 138) then Creates a yellow rectangular region at (125, 96) spanning 118 by 103 pixels then Draws a white circle centered at (209, 113) with radius 33.
; PLAN: r0=30(x), r1=138(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=125(x), r6=96(y), r7=118(width), r8=103(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=209(x), r11=113(y), r12=33(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 30
LDI r1, 138
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 125
LDI r6, 96
LDI r7, 118
LDI r8, 103
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 113
LDI r12, 33
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
