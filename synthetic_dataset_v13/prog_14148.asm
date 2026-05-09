; DESCRIPTION: Composite: Draws a green circle centered at (313, 52) with radius 23 then Creates a orange rectangular region at (111, 1) spanning 67 by 65 pixels.
; PLAN: r0=313(x), r1=52(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x), r6=1(y), r7=67(width), r8=65(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 52
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 1
LDI r7, 67
LDI r8, 65
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
