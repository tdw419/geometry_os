; DESCRIPTION: Composite: Places a cyan dot at position (278, 92) then Creates a magenta rectangular region at (33, 43) spanning 44 by 39 pixels then Draws a magenta circle centered at (268, 162) with radius 50.
; PLAN: r0=278(x), r1=92(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=33(x), r6=43(y), r7=44(width), r8=39(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=268(x), r11=162(y), r12=50(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 278
LDI r1, 92
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 33
LDI r6, 43
LDI r7, 44
LDI r8, 39
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 268
LDI r11, 162
LDI r12, 50
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
