; DESCRIPTION: Composite: Draws a magenta rectangle at (240, 11) with width 98 and height 118 then Places a cyan dot at position (458, 207) then Creates a red circular shape at (181, 172) with radius 13.
; PLAN: r0=240(x), r1=11(y), r2=98(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=458(x), r6=207(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=181(x), r11=172(y), r12=13(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 240
LDI r1, 11
LDI r2, 98
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 207
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 181
LDI r11, 172
LDI r12, 13
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
