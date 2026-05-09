; DESCRIPTION: Composite: Places a purple dot at position (488, 152) then Creates a yellow rectangular region at (372, 43) spanning 109 by 109 pixels then Draws a yellow circle centered at (165, 55) with radius 50.
; PLAN: r0=488(x), r1=152(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=372(x), r6=43(y), r7=109(width), r8=109(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=165(x), r11=55(y), r12=50(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 488
LDI r1, 152
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 372
LDI r6, 43
LDI r7, 109
LDI r8, 109
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 165
LDI r11, 55
LDI r12, 50
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
