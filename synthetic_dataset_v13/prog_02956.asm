; DESCRIPTION: Composite: Places a black circle of radius 18 at center (260, 168) then Draws a red rectangle at (228, 108) with width 89 and height 116 then Places a orange line segment connecting (140, 112) to (261, 233).
; PLAN: r0=260(x), r1=168(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=228(x), r6=108(y), r7=89(width), r8=116(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=140(x1), r11=112(y1), r12=261(x2), r13=233(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 168
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 228
LDI r6, 108
LDI r7, 89
LDI r8, 116
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 140
LDI r11, 112
LDI r12, 261
LDI r13, 233
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
