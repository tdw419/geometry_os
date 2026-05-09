; DESCRIPTION: Composite: Draws a blue rectangle at (54, 99) with width 83 and height 43 then Places a red dot at position (309, 190) then Creates a red circular shape at (312, 59) with radius 50.
; PLAN: r0=54(x), r1=99(y), r2=83(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x), r6=190(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=312(x), r11=59(y), r12=50(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 54
LDI r1, 99
LDI r2, 83
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 190
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 312
LDI r11, 59
LDI r12, 50
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
