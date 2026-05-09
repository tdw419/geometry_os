; DESCRIPTION: Composite: Renders a red disk with center (471, 108) and radius 33 then Places a purple 112x71 rectangle at position (304, 26) then Renders a blue line between points (198, 213) and (203, 254).
; PLAN: r0=471(x), r1=108(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=304(x), r6=26(y), r7=112(width), r8=71(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=198(x1), r11=213(y1), r12=203(x2), r13=254(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 471
LDI r1, 108
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 304
LDI r6, 26
LDI r7, 112
LDI r8, 71
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 213
LDI r12, 203
LDI r13, 254
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
