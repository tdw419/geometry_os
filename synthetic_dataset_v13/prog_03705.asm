; DESCRIPTION: Composite: Creates a white rectangular region at (96, 100) spanning 26 by 78 pixels then Places a cyan circle of radius 64 at center (236, 186) then Places a blue line segment connecting (373, 163) to (209, 100).
; PLAN: r0=96(x), r1=100(y), r2=26(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x), r6=186(y), r7=64(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=373(x1), r11=163(y1), r12=209(x2), r13=100(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 100
LDI r2, 26
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 186
LDI r7, 64
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 373
LDI r11, 163
LDI r12, 209
LDI r13, 100
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
