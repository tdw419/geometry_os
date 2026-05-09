; DESCRIPTION: Composite: Sets a single black pixel at (51, 126) then Places a purple 38x111 rectangle at position (84, 99) then Places a blue circle of radius 53 at center (135, 151).
; PLAN: r0=51(x), r1=126(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=84(x), r6=99(y), r7=38(width), r8=111(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=135(x), r11=151(y), r12=53(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 51
LDI r1, 126
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 84
LDI r6, 99
LDI r7, 38
LDI r8, 111
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 135
LDI r11, 151
LDI r12, 53
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
