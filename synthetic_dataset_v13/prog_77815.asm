; DESCRIPTION: Composite: Sets a single white pixel at (95, 237) then Creates a yellow rectangular region at (135, 39) spanning 107 by 111 pixels then Places a blue circle of radius 11 at center (477, 150).
; PLAN: r0=95(x), r1=237(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=135(x), r6=39(y), r7=107(width), r8=111(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=477(x), r11=150(y), r12=11(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 95
LDI r1, 237
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 135
LDI r6, 39
LDI r7, 107
LDI r8, 111
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 477
LDI r11, 150
LDI r12, 11
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
