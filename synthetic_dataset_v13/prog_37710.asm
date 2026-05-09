; DESCRIPTION: Composite: Places a black dot at position (502, 1) then Creates a black rectangular region at (320, 131) spanning 83 by 76 pixels then Draws a white circle centered at (417, 62) with radius 48.
; PLAN: r0=502(x), r1=1(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=320(x), r6=131(y), r7=83(width), r8=76(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=417(x), r11=62(y), r12=48(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 502
LDI r1, 1
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 320
LDI r6, 131
LDI r7, 83
LDI r8, 76
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 62
LDI r12, 48
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
