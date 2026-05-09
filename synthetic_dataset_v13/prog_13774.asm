; DESCRIPTION: Composite: Renders a cyan disk with center (74, 70) and radius 18 then Creates a blue rectangular region at (183, 184) spanning 35 by 29 pixels then Places a magenta dot at position (203, 36).
; PLAN: r0=74(x), r1=70(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x), r6=184(y), r7=35(width), r8=29(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=203(x), r11=36(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 74
LDI r1, 70
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 184
LDI r7, 35
LDI r8, 29
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 36
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
