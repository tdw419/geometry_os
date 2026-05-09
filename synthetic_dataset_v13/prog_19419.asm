; DESCRIPTION: Composite: Places a white dot at position (293, 173) then Creates a white rectangular region at (392, 134) spanning 62 by 36 pixels then Renders a orange disk with center (160, 119) and radius 74.
; PLAN: r0=293(x), r1=173(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=392(x), r6=134(y), r7=62(width), r8=36(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=160(x), r11=119(y), r12=74(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 293
LDI r1, 173
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 392
LDI r6, 134
LDI r7, 62
LDI r8, 36
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 160
LDI r11, 119
LDI r12, 74
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
