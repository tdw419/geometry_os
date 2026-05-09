; DESCRIPTION: Composite: Draws a cyan circle centered at (342, 79) with radius 64 then Places a green line segment connecting (495, 226) to (356, 21) then Draws a black rectangle at (141, 52) with width 12 and height 15.
; PLAN: r0=342(x), r1=79(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=495(x1), r6=226(y1), r7=356(x2), r8=21(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=141(x), r11=52(y), r12=12(width), r13=15(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 342
LDI r1, 79
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 495
LDI r6, 226
LDI r7, 356
LDI r8, 21
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 52
LDI r12, 12
LDI r13, 15
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
