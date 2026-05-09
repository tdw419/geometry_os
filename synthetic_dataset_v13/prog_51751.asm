; DESCRIPTION: Composite: Creates a magenta circular shape at (399, 61) with radius 34 then Renders a white line between points (282, 69) and (395, 104) then Renders a yellow box of size 50x113 starting at (336, 121).
; PLAN: r0=399(x), r1=61(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=282(x1), r6=69(y1), r7=395(x2), r8=104(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=336(x), r11=121(y), r12=50(width), r13=113(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 399
LDI r1, 61
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 282
LDI r6, 69
LDI r7, 395
LDI r8, 104
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 336
LDI r11, 121
LDI r12, 50
LDI r13, 113
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
