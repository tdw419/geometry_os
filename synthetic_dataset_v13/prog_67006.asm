; DESCRIPTION: Composite: Draws a green circle centered at (178, 208) with radius 33 then Sets a single yellow pixel at (365, 207) then Draws a blue rectangle at (384, 13) with width 95 and height 118.
; PLAN: r0=178(x), r1=208(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=365(x), r6=207(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=384(x), r11=13(y), r12=95(width), r13=118(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 208
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 365
LDI r6, 207
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 384
LDI r11, 13
LDI r12, 95
LDI r13, 118
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
