; DESCRIPTION: Composite: Sets a single orange pixel at (230, 240) then Places a orange line segment connecting (285, 253) to (327, 135) then Draws a white rectangle at (190, 113) with width 70 and height 86.
; PLAN: r0=230(x), r1=240(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=285(x1), r6=253(y1), r7=327(x2), r8=135(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=190(x), r11=113(y), r12=70(width), r13=86(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 240
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 285
LDI r6, 253
LDI r7, 327
LDI r8, 135
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 190
LDI r11, 113
LDI r12, 70
LDI r13, 86
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
