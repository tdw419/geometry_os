; DESCRIPTION: Composite: Draws a green rectangle at (228, 185) with width 103 and height 71 then Creates a orange circular shape at (299, 64) with radius 44 then Places a magenta line segment connecting (3, 19) to (114, 229).
; PLAN: r0=228(x), r1=185(y), r2=103(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x), r6=64(y), r7=44(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=3(x1), r11=19(y1), r12=114(x2), r13=229(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 228
LDI r1, 185
LDI r2, 103
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 64
LDI r7, 44
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 3
LDI r11, 19
LDI r12, 114
LDI r13, 229
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
