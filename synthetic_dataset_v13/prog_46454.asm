; DESCRIPTION: Composite: Renders a black line between points (47, 171) and (190, 206) then Places a green circle of radius 57 at center (287, 175) then Renders a black box of size 114x39 starting at (265, 63).
; PLAN: r0=47(x1), r1=171(y1), r2=190(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=175(y), r7=57(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=265(x), r11=63(y), r12=114(width), r13=39(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 47
LDI r1, 171
LDI r2, 190
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 175
LDI r7, 57
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 265
LDI r11, 63
LDI r12, 114
LDI r13, 39
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
