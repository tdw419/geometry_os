; DESCRIPTION: Composite: Renders a black box of size 85x34 starting at (28, 140) then Draws a orange circle centered at (70, 148) with radius 59.
; PLAN: r0=28(x), r1=140(y), r2=85(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=70(x), r6=148(y), r7=59(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 28
LDI r1, 140
LDI r2, 85
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 148
LDI r7, 59
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
