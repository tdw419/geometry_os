; DESCRIPTION: Composite: Draws a purple circle centered at (425, 109) with radius 55 then Creates a red rectangular region at (126, 4) spanning 52 by 111 pixels.
; PLAN: r0=425(x), r1=109(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x), r6=4(y), r7=52(width), r8=111(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 109
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 4
LDI r7, 52
LDI r8, 111
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
