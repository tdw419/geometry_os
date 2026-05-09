; DESCRIPTION: Composite: Draws a magenta rectangle at (295, 14) with width 115 and height 35 then Places a white dot at position (119, 125) then Renders a magenta line between points (104, 199) and (160, 127).
; PLAN: r0=295(x), r1=14(y), r2=115(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=119(x), r6=125(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=104(x1), r11=199(y1), r12=160(x2), r13=127(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 295
LDI r1, 14
LDI r2, 115
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 125
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 104
LDI r11, 199
LDI r12, 160
LDI r13, 127
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
