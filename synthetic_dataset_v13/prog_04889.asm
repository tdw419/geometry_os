; DESCRIPTION: Composite: Places a red line segment connecting (274, 19) to (165, 103) then Creates a blue circular shape at (135, 121) with radius 71 then Renders a red box of size 99x74 starting at (392, 137).
; PLAN: r0=274(x1), r1=19(y1), r2=165(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=121(y), r7=71(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=392(x), r11=137(y), r12=99(width), r13=74(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 19
LDI r2, 165
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 121
LDI r7, 71
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 392
LDI r11, 137
LDI r12, 99
LDI r13, 74
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
