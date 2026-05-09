; DESCRIPTION: Composite: Sets a single magenta pixel at (158, 13) then Draws a purple rectangle at (488, 14) with width 15 and height 87 then Places a red line segment connecting (55, 96) to (372, 53).
; PLAN: r0=158(x), r1=13(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=488(x), r6=14(y), r7=15(width), r8=87(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=55(x1), r11=96(y1), r12=372(x2), r13=53(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 13
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 488
LDI r6, 14
LDI r7, 15
LDI r8, 87
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 96
LDI r12, 372
LDI r13, 53
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
