; DESCRIPTION: Composite: Renders a blue line between points (393, 177) and (33, 246) then Creates a red circular shape at (419, 195) with radius 28 then Places a blue 69x63 rectangle at position (175, 158).
; PLAN: r0=393(x1), r1=177(y1), r2=33(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=419(x), r6=195(y), r7=28(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=175(x), r11=158(y), r12=69(width), r13=63(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 393
LDI r1, 177
LDI r2, 33
LDI r3, 246
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 195
LDI r7, 28
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 175
LDI r11, 158
LDI r12, 69
LDI r13, 63
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
