; DESCRIPTION: Composite: Places a magenta 29x96 rectangle at position (323, 100) then Places a cyan dot at position (339, 11) then Draws a yellow circle centered at (428, 184) with radius 23.
; PLAN: r0=323(x), r1=100(y), r2=29(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x), r6=11(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=428(x), r11=184(y), r12=23(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 323
LDI r1, 100
LDI r2, 29
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 11
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 428
LDI r11, 184
LDI r12, 23
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
