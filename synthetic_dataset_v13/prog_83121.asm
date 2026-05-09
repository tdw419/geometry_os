; DESCRIPTION: Composite: Renders a yellow line between points (349, 247) and (212, 154) then Places a blue dot at position (296, 0) then Renders a white box of size 108x30 starting at (33, 217).
; PLAN: r0=349(x1), r1=247(y1), r2=212(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=0(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=33(x), r11=217(y), r12=108(width), r13=30(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 247
LDI r2, 212
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 0
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 33
LDI r11, 217
LDI r12, 108
LDI r13, 30
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
