; DESCRIPTION: Composite: Renders a orange box of size 103x53 starting at (294, 28) then Draws a green circle centered at (451, 87) with radius 35.
; PLAN: r0=294(x), r1=28(y), r2=103(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=451(x), r6=87(y), r7=35(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 294
LDI r1, 28
LDI r2, 103
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 87
LDI r7, 35
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
