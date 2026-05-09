; DESCRIPTION: Composite: Places a magenta 59x114 rectangle at position (259, 47) then Creates a white circular shape at (304, 67) with radius 15 then Draws a cyan line from (154, 96) to (134, 254).
; PLAN: r0=259(x), r1=47(y), r2=59(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=304(x), r6=67(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=154(x1), r11=96(y1), r12=134(x2), r13=254(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 47
LDI r2, 59
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 67
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 154
LDI r11, 96
LDI r12, 134
LDI r13, 254
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
