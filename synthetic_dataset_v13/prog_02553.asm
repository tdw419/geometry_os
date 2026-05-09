; DESCRIPTION: Composite: Places a yellow dot at position (85, 12) then Renders a orange disk with center (296, 143) and radius 56 then Draws a purple rectangle at (437, 152) with width 12 and height 93.
; PLAN: r0=85(x), r1=12(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=143(y), r7=56(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=437(x), r11=152(y), r12=12(width), r13=93(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 12
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 296
LDI r6, 143
LDI r7, 56
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 437
LDI r11, 152
LDI r12, 12
LDI r13, 93
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
