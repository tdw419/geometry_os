; DESCRIPTION: Composite: Sets a single white pixel at (165, 33) then Renders a yellow line between points (263, 109) and (2, 136) then Draws a red rectangle at (23, 1) with width 74 and height 49.
; PLAN: r0=165(x), r1=33(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=263(x1), r6=109(y1), r7=2(x2), r8=136(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=23(x), r11=1(y), r12=74(width), r13=49(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 165
LDI r1, 33
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 263
LDI r6, 109
LDI r7, 2
LDI r8, 136
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 23
LDI r11, 1
LDI r12, 74
LDI r13, 49
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
