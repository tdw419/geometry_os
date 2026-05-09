; DESCRIPTION: Composite: Renders a purple box of size 59x53 starting at (150, 58) then Places a black line segment connecting (328, 137) to (299, 171) then Places a white circle of radius 54 at center (234, 152).
; PLAN: r0=150(x), r1=58(y), r2=59(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x1), r6=137(y1), r7=299(x2), r8=171(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=234(x), r11=152(y), r12=54(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 150
LDI r1, 58
LDI r2, 59
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 137
LDI r7, 299
LDI r8, 171
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 152
LDI r12, 54
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
