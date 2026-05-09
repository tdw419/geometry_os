; DESCRIPTION: Composite: Draws a black circle centered at (369, 113) with radius 10 then Renders a blue box of size 103x97 starting at (218, 122) then Renders a blue line between points (361, 74) and (178, 120).
; PLAN: r0=369(x), r1=113(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x), r6=122(y), r7=103(width), r8=97(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=361(x1), r11=74(y1), r12=178(x2), r13=120(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 113
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 122
LDI r7, 103
LDI r8, 97
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 361
LDI r11, 74
LDI r12, 178
LDI r13, 120
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
