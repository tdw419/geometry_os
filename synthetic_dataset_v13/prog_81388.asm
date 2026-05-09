; DESCRIPTION: Composite: Places a magenta line segment connecting (2, 113) to (135, 17) then Places a white circle of radius 40 at center (207, 121) then Renders a cyan box of size 45x80 starting at (173, 120).
; PLAN: r0=2(x1), r1=113(y1), r2=135(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=121(y), r7=40(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=173(x), r11=120(y), r12=45(width), r13=80(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 2
LDI r1, 113
LDI r2, 135
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 121
LDI r7, 40
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 173
LDI r11, 120
LDI r12, 45
LDI r13, 80
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
