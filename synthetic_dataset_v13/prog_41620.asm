; DESCRIPTION: Composite: Draws a cyan circle centered at (386, 185) with radius 43 then Places a blue line segment connecting (152, 171) to (100, 230) then Places a magenta 78x28 rectangle at position (5, 160).
; PLAN: r0=386(x), r1=185(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x1), r6=171(y1), r7=100(x2), r8=230(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=5(x), r11=160(y), r12=78(width), r13=28(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 185
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 171
LDI r7, 100
LDI r8, 230
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 5
LDI r11, 160
LDI r12, 78
LDI r13, 28
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
