; DESCRIPTION: Composite: Creates a orange rectangular region at (1, 136) spanning 50 by 98 pixels then Renders a white disk with center (124, 63) and radius 24 then Places a white dot at position (360, 143).
; PLAN: r0=1(x), r1=136(y), r2=50(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=124(x), r6=63(y), r7=24(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=360(x), r11=143(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 1
LDI r1, 136
LDI r2, 50
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 63
LDI r7, 24
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 360
LDI r11, 143
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
