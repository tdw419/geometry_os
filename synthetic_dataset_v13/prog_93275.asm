; DESCRIPTION: Composite: Renders a red box of size 48x94 starting at (308, 106) then Draws a orange circle centered at (375, 189) with radius 47.
; PLAN: r0=308(x), r1=106(y), r2=48(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x), r6=189(y), r7=47(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 308
LDI r1, 106
LDI r2, 48
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 189
LDI r7, 47
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
