; DESCRIPTION: Composite: Places a purple 99x106 rectangle at position (147, 15) then Renders a purple disk with center (154, 148) and radius 15 then Places a white dot at position (403, 207).
; PLAN: r0=147(x), r1=15(y), r2=99(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x), r6=148(y), r7=15(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=403(x), r11=207(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 147
LDI r1, 15
LDI r2, 99
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 148
LDI r7, 15
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 403
LDI r11, 207
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
