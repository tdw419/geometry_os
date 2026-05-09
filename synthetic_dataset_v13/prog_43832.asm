; DESCRIPTION: Composite: Places a cyan line segment connecting (294, 219) to (411, 233) then Places a magenta circle of radius 17 at center (256, 163) then Creates a blue rectangular region at (47, 148) spanning 45 by 21 pixels.
; PLAN: r0=294(x1), r1=219(y1), r2=411(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=256(x), r6=163(y), r7=17(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=47(x), r11=148(y), r12=45(width), r13=21(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 219
LDI r2, 411
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 163
LDI r7, 17
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 47
LDI r11, 148
LDI r12, 45
LDI r13, 21
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
