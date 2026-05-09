; DESCRIPTION: Composite: Creates a magenta circular shape at (148, 111) with radius 74 then Sets a single magenta pixel at (183, 25) then Draws a magenta rectangle at (419, 104) with width 86 and height 98.
; PLAN: r0=148(x), r1=111(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x), r6=25(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=419(x), r11=104(y), r12=86(width), r13=98(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 111
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 25
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 419
LDI r11, 104
LDI r12, 86
LDI r13, 98
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
