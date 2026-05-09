; DESCRIPTION: Composite: Sets a single purple pixel at (460, 44) then Renders a black line between points (287, 69) and (291, 235) then Draws a purple rectangle at (150, 141) with width 74 and height 98.
; PLAN: r0=460(x), r1=44(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=287(x1), r6=69(y1), r7=291(x2), r8=235(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=150(x), r11=141(y), r12=74(width), r13=98(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 460
LDI r1, 44
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 287
LDI r6, 69
LDI r7, 291
LDI r8, 235
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 141
LDI r12, 74
LDI r13, 98
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
