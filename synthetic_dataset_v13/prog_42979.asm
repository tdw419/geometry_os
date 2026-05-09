; DESCRIPTION: Composite: Sets a single black pixel at (328, 214) then Draws a red rectangle at (33, 52) with width 36 and height 118 then Draws a orange circle centered at (283, 183) with radius 38.
; PLAN: r0=328(x), r1=214(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=33(x), r6=52(y), r7=36(width), r8=118(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=283(x), r11=183(y), r12=38(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 328
LDI r1, 214
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 33
LDI r6, 52
LDI r7, 36
LDI r8, 118
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 283
LDI r11, 183
LDI r12, 38
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
