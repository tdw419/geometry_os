; DESCRIPTION: Composite: Draws a magenta rectangle at (94, 93) with width 108 and height 87 then Sets a single orange pixel at (423, 202) then Places a blue circle of radius 57 at center (285, 121).
; PLAN: r0=94(x), r1=93(y), r2=108(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x), r6=202(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=285(x), r11=121(y), r12=57(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 94
LDI r1, 93
LDI r2, 108
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 202
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 285
LDI r11, 121
LDI r12, 57
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
