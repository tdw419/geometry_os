; DESCRIPTION: Composite: Draws a white circle centered at (134, 69) with radius 69 then Draws a blue line from (361, 79) to (395, 193) then Places a white 24x29 rectangle at position (199, 183).
; PLAN: r0=134(x), r1=69(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=361(x1), r6=79(y1), r7=395(x2), r8=193(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=199(x), r11=183(y), r12=24(width), r13=29(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 69
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 361
LDI r6, 79
LDI r7, 395
LDI r8, 193
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 183
LDI r12, 24
LDI r13, 29
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
