; DESCRIPTION: Composite: Renders a black disk with center (448, 62) and radius 52 then Creates a black rectangular region at (198, 107) spanning 55 by 108 pixels.
; PLAN: r0=448(x), r1=62(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=198(x), r6=107(y), r7=55(width), r8=108(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 448
LDI r1, 62
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 198
LDI r6, 107
LDI r7, 55
LDI r8, 108
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
