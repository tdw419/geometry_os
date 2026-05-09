; DESCRIPTION: Composite: Creates a white circular shape at (424, 113) with radius 26 then Draws a yellow rectangle at (105, 217) with width 40 and height 25 then Draws a green line from (333, 200) to (42, 60).
; PLAN: r0=424(x), r1=113(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x), r6=217(y), r7=40(width), r8=25(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=333(x1), r11=200(y1), r12=42(x2), r13=60(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 113
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 217
LDI r7, 40
LDI r8, 25
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 200
LDI r12, 42
LDI r13, 60
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
