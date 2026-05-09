; DESCRIPTION: Composite: Places a yellow dot at position (494, 127) then Draws a orange circle centered at (172, 59) with radius 48 then Places a yellow 107x82 rectangle at position (150, 87).
; PLAN: r0=494(x), r1=127(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=172(x), r6=59(y), r7=48(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=150(x), r11=87(y), r12=107(width), r13=82(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 494
LDI r1, 127
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 172
LDI r6, 59
LDI r7, 48
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 150
LDI r11, 87
LDI r12, 107
LDI r13, 82
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
