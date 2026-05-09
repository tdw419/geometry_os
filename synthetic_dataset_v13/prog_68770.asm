; DESCRIPTION: Composite: Renders a red disk with center (139, 83) and radius 48 then Sets a single purple pixel at (206, 126) then Draws a purple rectangle at (76, 133) with width 98 and height 111.
; PLAN: r0=139(x), r1=83(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x), r6=126(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=76(x), r11=133(y), r12=98(width), r13=111(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 83
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 126
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 76
LDI r11, 133
LDI r12, 98
LDI r13, 111
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
