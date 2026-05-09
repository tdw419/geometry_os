; DESCRIPTION: Composite: Draws a black circle centered at (99, 118) with radius 18 then Sets a single red pixel at (482, 223) then Renders a magenta box of size 61x20 starting at (449, 66).
; PLAN: r0=99(x), r1=118(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=482(x), r6=223(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=449(x), r11=66(y), r12=61(width), r13=20(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 99
LDI r1, 118
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 482
LDI r6, 223
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 449
LDI r11, 66
LDI r12, 61
LDI r13, 20
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
