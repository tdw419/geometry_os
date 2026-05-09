; DESCRIPTION: Composite: Places a white dot at position (278, 212) then Creates a red circular shape at (434, 108) with radius 11 then Creates a yellow rectangular region at (130, 69) spanning 98 by 85 pixels.
; PLAN: r0=278(x), r1=212(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=434(x), r6=108(y), r7=11(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=130(x), r11=69(y), r12=98(width), r13=85(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 278
LDI r1, 212
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 434
LDI r6, 108
LDI r7, 11
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 130
LDI r11, 69
LDI r12, 98
LDI r13, 85
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
