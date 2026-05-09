; DESCRIPTION: Composite: Draws a green line from (293, 171) to (59, 29) then Places a green circle of radius 20 at center (292, 210) then Places a magenta 69x18 rectangle at position (429, 158).
; PLAN: r0=293(x1), r1=171(y1), r2=59(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=292(x), r6=210(y), r7=20(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=429(x), r11=158(y), r12=69(width), r13=18(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 293
LDI r1, 171
LDI r2, 59
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 210
LDI r7, 20
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 429
LDI r11, 158
LDI r12, 69
LDI r13, 18
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
