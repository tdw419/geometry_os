; DESCRIPTION: Composite: Creates a cyan circular shape at (262, 182) with radius 63 then Creates a magenta rectangular region at (420, 160) spanning 51 by 90 pixels then Places a white line segment connecting (90, 222) to (185, 62).
; PLAN: r0=262(x), r1=182(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=420(x), r6=160(y), r7=51(width), r8=90(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=90(x1), r11=222(y1), r12=185(x2), r13=62(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 182
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 420
LDI r6, 160
LDI r7, 51
LDI r8, 90
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 222
LDI r12, 185
LDI r13, 62
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
