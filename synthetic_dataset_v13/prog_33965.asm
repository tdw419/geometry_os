; DESCRIPTION: Composite: Draws a magenta line from (424, 72) to (445, 215) then Draws a orange circle centered at (10, 225) with radius 10 then Draws a red rectangle at (76, 114) with width 38 and height 60.
; PLAN: r0=424(x1), r1=72(y1), r2=445(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=10(x), r6=225(y), r7=10(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=76(x), r11=114(y), r12=38(width), r13=60(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 72
LDI r2, 445
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 225
LDI r7, 10
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 76
LDI r11, 114
LDI r12, 38
LDI r13, 60
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
