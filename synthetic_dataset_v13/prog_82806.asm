; DESCRIPTION: Composite: Sets a single red pixel at (282, 159) then Draws a green circle centered at (280, 169) with radius 41 then Places a blue 50x90 rectangle at position (447, 119).
; PLAN: r0=282(x), r1=159(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=169(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=447(x), r11=119(y), r12=50(width), r13=90(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 282
LDI r1, 159
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 280
LDI r6, 169
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 447
LDI r11, 119
LDI r12, 50
LDI r13, 90
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
