; DESCRIPTION: Composite: Sets a single red pixel at (385, 172) then Creates a cyan rectangular region at (122, 112) spanning 50 by 57 pixels then Places a blue circle of radius 76 at center (142, 81).
; PLAN: r0=385(x), r1=172(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=122(x), r6=112(y), r7=50(width), r8=57(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=142(x), r11=81(y), r12=76(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 385
LDI r1, 172
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 122
LDI r6, 112
LDI r7, 50
LDI r8, 57
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 81
LDI r12, 76
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
