; DESCRIPTION: Composite: Draws a blue circle centered at (322, 145) with radius 80 then Creates a orange rectangular region at (379, 108) spanning 79 by 16 pixels.
; PLAN: r0=322(x), r1=145(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x), r6=108(y), r7=79(width), r8=16(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 145
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 108
LDI r7, 79
LDI r8, 16
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
