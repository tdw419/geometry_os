; DESCRIPTION: Composite: Creates a red rectangular region at (218, 187) spanning 26 by 61 pixels then Places a magenta line segment connecting (495, 255) to (23, 130) then Places a purple circle of radius 64 at center (70, 151).
; PLAN: r0=218(x), r1=187(y), r2=26(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=495(x1), r6=255(y1), r7=23(x2), r8=130(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=70(x), r11=151(y), r12=64(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 218
LDI r1, 187
LDI r2, 26
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 255
LDI r7, 23
LDI r8, 130
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 151
LDI r12, 64
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
