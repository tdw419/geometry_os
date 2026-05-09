; DESCRIPTION: Composite: Places a green dot at position (400, 5) then Creates a purple rectangular region at (278, 12) spanning 82 by 20 pixels then Draws a white circle centered at (429, 123) with radius 50.
; PLAN: r0=400(x), r1=5(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=12(y), r7=82(width), r8=20(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=429(x), r11=123(y), r12=50(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 400
LDI r1, 5
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 278
LDI r6, 12
LDI r7, 82
LDI r8, 20
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 123
LDI r12, 50
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
