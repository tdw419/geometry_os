; DESCRIPTION: Composite: Places a magenta 48x112 rectangle at position (44, 71) then Draws a orange circle centered at (222, 78) with radius 34 then Places a red dot at position (4, 107).
; PLAN: r0=44(x), r1=71(y), r2=48(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x), r6=78(y), r7=34(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=4(x), r11=107(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 44
LDI r1, 71
LDI r2, 48
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 78
LDI r7, 34
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 4
LDI r11, 107
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
