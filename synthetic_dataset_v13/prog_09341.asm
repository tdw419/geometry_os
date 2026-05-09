; DESCRIPTION: Composite: Draws a red circle centered at (245, 50) with radius 41 then Places a magenta 21x30 rectangle at position (108, 76) then Draws a magenta line from (161, 11) to (476, 145).
; PLAN: r0=245(x), r1=50(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x), r6=76(y), r7=21(width), r8=30(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=161(x1), r11=11(y1), r12=476(x2), r13=145(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 245
LDI r1, 50
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 76
LDI r7, 21
LDI r8, 30
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 11
LDI r12, 476
LDI r13, 145
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
