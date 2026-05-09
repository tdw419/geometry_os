; DESCRIPTION: Composite: Places a red dot at position (475, 207) then Renders a yellow box of size 92x104 starting at (155, 125) then Places a purple circle of radius 15 at center (111, 151).
; PLAN: r0=475(x), r1=207(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=155(x), r6=125(y), r7=92(width), r8=104(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=111(x), r11=151(y), r12=15(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 475
LDI r1, 207
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 155
LDI r6, 125
LDI r7, 92
LDI r8, 104
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 151
LDI r12, 15
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
