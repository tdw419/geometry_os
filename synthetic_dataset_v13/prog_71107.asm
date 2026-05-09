; DESCRIPTION: Composite: Places a green dot at position (490, 126) then Places a white line segment connecting (202, 183) to (262, 56) then Creates a magenta rectangular region at (170, 60) spanning 49 by 59 pixels.
; PLAN: r0=490(x), r1=126(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=202(x1), r6=183(y1), r7=262(x2), r8=56(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=170(x), r11=60(y), r12=49(width), r13=59(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 490
LDI r1, 126
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 202
LDI r6, 183
LDI r7, 262
LDI r8, 56
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 170
LDI r11, 60
LDI r12, 49
LDI r13, 59
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
