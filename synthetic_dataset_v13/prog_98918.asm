; DESCRIPTION: Composite: Sets a single magenta pixel at (349, 143) then Draws a cyan circle centered at (340, 211) with radius 11 then Places a blue 119x79 rectangle at position (311, 36).
; PLAN: r0=349(x), r1=143(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=340(x), r6=211(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=311(x), r11=36(y), r12=119(width), r13=79(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 143
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 340
LDI r6, 211
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 311
LDI r11, 36
LDI r12, 119
LDI r13, 79
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
