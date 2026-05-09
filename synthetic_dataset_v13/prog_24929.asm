; DESCRIPTION: Composite: Renders a orange box of size 109x89 starting at (339, 117) then Draws a yellow circle centered at (254, 168) with radius 63.
; PLAN: r0=339(x), r1=117(y), r2=109(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=254(x), r6=168(y), r7=63(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 339
LDI r1, 117
LDI r2, 109
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 168
LDI r7, 63
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
