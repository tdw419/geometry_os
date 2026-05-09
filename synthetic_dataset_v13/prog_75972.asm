; DESCRIPTION: Composite: Creates a red rectangular region at (385, 211) spanning 87 by 20 pixels then Places a black dot at position (376, 116) then Places a red circle of radius 48 at center (120, 136).
; PLAN: r0=385(x), r1=211(y), r2=87(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=376(x), r6=116(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=120(x), r11=136(y), r12=48(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 385
LDI r1, 211
LDI r2, 87
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 116
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 120
LDI r11, 136
LDI r12, 48
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
