; DESCRIPTION: Composite: Sets a single blue pixel at (331, 187) then Draws a red circle centered at (180, 165) with radius 60 then Places a black 23x89 rectangle at position (363, 30).
; PLAN: r0=331(x), r1=187(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=165(y), r7=60(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=363(x), r11=30(y), r12=23(width), r13=89(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 331
LDI r1, 187
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 180
LDI r6, 165
LDI r7, 60
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 363
LDI r11, 30
LDI r12, 23
LDI r13, 89
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
