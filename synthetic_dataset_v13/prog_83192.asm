; DESCRIPTION: Composite: Places a black 69x100 rectangle at position (33, 75) then Draws a magenta circle centered at (279, 110) with radius 80 then Places a cyan line segment connecting (122, 191) to (31, 19).
; PLAN: r0=33(x), r1=75(y), r2=69(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=279(x), r6=110(y), r7=80(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=122(x1), r11=191(y1), r12=31(x2), r13=19(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 33
LDI r1, 75
LDI r2, 69
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 110
LDI r7, 80
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 122
LDI r11, 191
LDI r12, 31
LDI r13, 19
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
