; DESCRIPTION: Composite: Draws a magenta rectangle at (191, 221) with width 94 and height 29 then Places a purple dot at position (93, 237) then Places a purple line segment connecting (223, 74) to (322, 221).
; PLAN: r0=191(x), r1=221(y), r2=94(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=237(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=223(x1), r11=74(y1), r12=322(x2), r13=221(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 221
LDI r2, 94
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 237
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 223
LDI r11, 74
LDI r12, 322
LDI r13, 221
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
