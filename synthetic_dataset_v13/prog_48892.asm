; DESCRIPTION: Composite: Places a purple circle of radius 60 at center (169, 143) then Draws a blue rectangle at (323, 24) with width 109 and height 29 then Places a white dot at position (109, 138).
; PLAN: r0=169(x), r1=143(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x), r6=24(y), r7=109(width), r8=29(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=109(x), r11=138(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 169
LDI r1, 143
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 24
LDI r7, 109
LDI r8, 29
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 109
LDI r11, 138
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
