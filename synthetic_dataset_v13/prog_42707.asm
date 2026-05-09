; DESCRIPTION: Composite: Places a black line segment connecting (284, 15) to (177, 96) then Places a cyan circle of radius 23 at center (238, 132) then Places a magenta 106x114 rectangle at position (291, 91).
; PLAN: r0=284(x1), r1=15(y1), r2=177(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=132(y), r7=23(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=291(x), r11=91(y), r12=106(width), r13=114(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 15
LDI r2, 177
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 132
LDI r7, 23
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 291
LDI r11, 91
LDI r12, 106
LDI r13, 114
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
