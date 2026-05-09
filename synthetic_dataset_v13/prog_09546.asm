; DESCRIPTION: Composite: Places a magenta dot at position (345, 217) then Draws a magenta rectangle at (346, 55) with width 118 and height 104 then Renders a purple line between points (189, 240) and (353, 184).
; PLAN: r0=345(x), r1=217(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=55(y), r7=118(width), r8=104(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=189(x1), r11=240(y1), r12=353(x2), r13=184(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 217
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 346
LDI r6, 55
LDI r7, 118
LDI r8, 104
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 240
LDI r12, 353
LDI r13, 184
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
