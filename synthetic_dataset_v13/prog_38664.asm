; DESCRIPTION: Composite: Places a magenta dot at position (492, 218) then Renders a orange box of size 12x81 starting at (344, 137) then Draws a blue circle centered at (383, 108) with radius 21.
; PLAN: r0=492(x), r1=218(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=344(x), r6=137(y), r7=12(width), r8=81(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=383(x), r11=108(y), r12=21(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 492
LDI r1, 218
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 344
LDI r6, 137
LDI r7, 12
LDI r8, 81
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 108
LDI r12, 21
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
