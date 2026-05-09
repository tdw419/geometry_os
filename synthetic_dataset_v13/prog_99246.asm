; DESCRIPTION: Composite: Places a orange dot at position (138, 191) then Places a black line segment connecting (183, 196) to (325, 214) then Draws a magenta rectangle at (380, 173) with width 38 and height 27.
; PLAN: r0=138(x), r1=191(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=183(x1), r6=196(y1), r7=325(x2), r8=214(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=380(x), r11=173(y), r12=38(width), r13=27(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 191
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 183
LDI r6, 196
LDI r7, 325
LDI r8, 214
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 380
LDI r11, 173
LDI r12, 38
LDI r13, 27
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
