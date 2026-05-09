; DESCRIPTION: Composite: Places a white dot at position (417, 121) then Places a magenta 11x83 rectangle at position (25, 153) then Renders a purple disk with center (152, 101) and radius 67.
; PLAN: r0=417(x), r1=121(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=25(x), r6=153(y), r7=11(width), r8=83(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=152(x), r11=101(y), r12=67(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 417
LDI r1, 121
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 25
LDI r6, 153
LDI r7, 11
LDI r8, 83
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 101
LDI r12, 67
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
