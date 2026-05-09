; DESCRIPTION: Composite: Draws a purple rectangle at (127, 187) with width 70 and height 49 then Renders a red disk with center (372, 138) and radius 37.
; PLAN: r0=127(x), r1=187(y), r2=70(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=372(x), r6=138(y), r7=37(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 127
LDI r1, 187
LDI r2, 70
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 138
LDI r7, 37
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
