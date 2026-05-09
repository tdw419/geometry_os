; DESCRIPTION: Composite: Renders a red box of size 72x113 starting at (98, 3) then Creates a black circular shape at (454, 200) with radius 54 then Draws a white line from (499, 157) to (461, 36).
; PLAN: r0=98(x), r1=3(y), r2=72(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x), r6=200(y), r7=54(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=499(x1), r11=157(y1), r12=461(x2), r13=36(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 98
LDI r1, 3
LDI r2, 72
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 200
LDI r7, 54
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 499
LDI r11, 157
LDI r12, 461
LDI r13, 36
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
