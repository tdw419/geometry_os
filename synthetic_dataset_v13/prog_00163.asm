; DESCRIPTION: Composite: Draws a orange circle centered at (151, 122) with radius 11 then Renders a yellow box of size 34x18 starting at (117, 200).
; PLAN: r0=151(x), r1=122(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=117(x), r6=200(y), r7=34(width), r8=18(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 122
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 117
LDI r6, 200
LDI r7, 34
LDI r8, 18
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
