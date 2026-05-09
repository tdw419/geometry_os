; DESCRIPTION: Composite: Renders a white box of size 13x76 starting at (464, 131) then Places a purple circle of radius 39 at center (54, 146) then Draws a yellow line from (107, 195) to (19, 43).
; PLAN: r0=464(x), r1=131(y), r2=13(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=54(x), r6=146(y), r7=39(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=107(x1), r11=195(y1), r12=19(x2), r13=43(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 464
LDI r1, 131
LDI r2, 13
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 146
LDI r7, 39
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 107
LDI r11, 195
LDI r12, 19
LDI r13, 43
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
