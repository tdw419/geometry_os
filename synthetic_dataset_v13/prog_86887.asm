; DESCRIPTION: Composite: Draws a red circle centered at (184, 118) with radius 23 then Sets a single yellow pixel at (104, 209) then Draws a blue rectangle at (417, 50) with width 57 and height 25.
; PLAN: r0=184(x), r1=118(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x), r6=209(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=417(x), r11=50(y), r12=57(width), r13=25(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 118
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 209
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 417
LDI r11, 50
LDI r12, 57
LDI r13, 25
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
