; DESCRIPTION: Composite: Renders a magenta box of size 70x119 starting at (331, 122) then Draws a green circle centered at (387, 197) with radius 57 then Sets a single blue pixel at (478, 172).
; PLAN: r0=331(x), r1=122(y), r2=70(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x), r6=197(y), r7=57(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=478(x), r11=172(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 331
LDI r1, 122
LDI r2, 70
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 197
LDI r7, 57
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 478
LDI r11, 172
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
