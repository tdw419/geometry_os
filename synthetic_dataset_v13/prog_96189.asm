; DESCRIPTION: Composite: Renders a red disk with center (241, 120) and radius 43 then Draws a black line from (418, 6) to (490, 204) then Draws a purple rectangle at (365, 82) with width 119 and height 47.
; PLAN: r0=241(x), r1=120(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=418(x1), r6=6(y1), r7=490(x2), r8=204(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=365(x), r11=82(y), r12=119(width), r13=47(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 120
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 418
LDI r6, 6
LDI r7, 490
LDI r8, 204
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 82
LDI r12, 119
LDI r13, 47
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
