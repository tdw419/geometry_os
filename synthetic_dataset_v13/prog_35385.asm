; DESCRIPTION: Composite: Creates a magenta circular shape at (296, 158) with radius 71 then Places a white dot at position (448, 220) then Creates a magenta rectangular region at (96, 29) spanning 34 by 79 pixels.
; PLAN: r0=296(x), r1=158(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=448(x), r6=220(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=96(x), r11=29(y), r12=34(width), r13=79(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 296
LDI r1, 158
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 448
LDI r6, 220
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 96
LDI r11, 29
LDI r12, 34
LDI r13, 79
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
