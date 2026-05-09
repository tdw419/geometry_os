; DESCRIPTION: Composite: Draws a cyan circle centered at (337, 131) with radius 61 then Places a black 116x100 rectangle at position (381, 4) then Places a magenta line segment connecting (482, 67) to (494, 12).
; PLAN: r0=337(x), r1=131(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=381(x), r6=4(y), r7=116(width), r8=100(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=482(x1), r11=67(y1), r12=494(x2), r13=12(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 337
LDI r1, 131
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 381
LDI r6, 4
LDI r7, 116
LDI r8, 100
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 482
LDI r11, 67
LDI r12, 494
LDI r13, 12
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
