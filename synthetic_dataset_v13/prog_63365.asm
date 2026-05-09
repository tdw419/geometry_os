; DESCRIPTION: Composite: Draws a yellow rectangle at (382, 132) with width 72 and height 48 then Places a blue circle of radius 42 at center (238, 141) then Sets a single black pixel at (308, 169).
; PLAN: r0=382(x), r1=132(y), r2=72(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x), r6=141(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=308(x), r11=169(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 382
LDI r1, 132
LDI r2, 72
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 141
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 308
LDI r11, 169
LDI r12, 0x000000
PSET r10, r11, r12
HALT
