; DESCRIPTION: Composite: Creates a magenta circular shape at (238, 107) with radius 79 then Places a white line segment connecting (272, 240) to (135, 85) then Places a purple 52x22 rectangle at position (13, 225).
; PLAN: r0=238(x), r1=107(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x1), r6=240(y1), r7=135(x2), r8=85(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=13(x), r11=225(y), r12=52(width), r13=22(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 238
LDI r1, 107
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 240
LDI r7, 135
LDI r8, 85
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 225
LDI r12, 52
LDI r13, 22
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
