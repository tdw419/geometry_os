; DESCRIPTION: Composite: Creates a orange rectangular region at (371, 78) spanning 16 by 51 pixels then Places a cyan dot at position (47, 200) then Draws a magenta circle centered at (210, 170) with radius 14.
; PLAN: r0=371(x), r1=78(y), r2=16(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=47(x), r6=200(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=210(x), r11=170(y), r12=14(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 371
LDI r1, 78
LDI r2, 16
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 47
LDI r6, 200
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 210
LDI r11, 170
LDI r12, 14
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
