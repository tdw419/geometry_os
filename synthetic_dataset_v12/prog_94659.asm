; DESCRIPTION: Composite: Creates a white circular shape at (69, 174) with radius 28 then Draws a blue line from (20, 173) to (268, 42) then Draws a black rectangle at (24, 16) with width 23 and height 73.
; PLAN: r0=69(x), r1=174(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x1), r6=173(y1), r7=268(x2), r8=42(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=24(x), r11=16(y), r12=23(width), r13=73(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 174
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 173
LDI r7, 268
LDI r8, 42
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 24
LDI r11, 16
LDI r12, 23
LDI r13, 73
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
