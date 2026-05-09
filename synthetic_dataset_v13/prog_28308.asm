; DESCRIPTION: Composite: Draws a blue circle centered at (221, 71) with radius 33 then Places a red dot at position (452, 33) then Draws a magenta rectangle at (246, 30) with width 56 and height 61.
; PLAN: r0=221(x), r1=71(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=452(x), r6=33(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=246(x), r11=30(y), r12=56(width), r13=61(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 221
LDI r1, 71
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 452
LDI r6, 33
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 246
LDI r11, 30
LDI r12, 56
LDI r13, 61
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
