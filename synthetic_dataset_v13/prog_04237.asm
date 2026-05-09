; DESCRIPTION: Composite: Draws a black rectangle at (311, 165) with width 103 and height 87 then Draws a green line from (401, 131) to (78, 210) then Creates a magenta circular shape at (142, 90) with radius 40.
; PLAN: r0=311(x), r1=165(y), r2=103(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x1), r6=131(y1), r7=78(x2), r8=210(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=142(x), r11=90(y), r12=40(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 311
LDI r1, 165
LDI r2, 103
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 131
LDI r7, 78
LDI r8, 210
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 90
LDI r12, 40
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
