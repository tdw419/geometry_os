; DESCRIPTION: Composite: Sets a single white pixel at (13, 72) then Draws a white line from (375, 13) to (94, 214) then Draws a yellow rectangle at (184, 62) with width 116 and height 13.
; PLAN: r0=13(x), r1=72(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=375(x1), r6=13(y1), r7=94(x2), r8=214(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=184(x), r11=62(y), r12=116(width), r13=13(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 72
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 375
LDI r6, 13
LDI r7, 94
LDI r8, 214
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 62
LDI r12, 116
LDI r13, 13
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
