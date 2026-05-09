; DESCRIPTION: Composite: Sets a single white pixel at (277, 78) then Creates a purple circular shape at (113, 131) with radius 25 then Draws a magenta rectangle at (74, 65) with width 89 and height 14.
; PLAN: r0=277(x), r1=78(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=113(x), r6=131(y), r7=25(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=74(x), r11=65(y), r12=89(width), r13=14(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 78
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 113
LDI r6, 131
LDI r7, 25
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 74
LDI r11, 65
LDI r12, 89
LDI r13, 14
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
