; DESCRIPTION: Composite: Renders a white box of size 79x53 starting at (340, 126) then Draws a orange circle centered at (182, 100) with radius 55.
; PLAN: r0=340(x), r1=126(y), r2=79(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x), r6=100(y), r7=55(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 340
LDI r1, 126
LDI r2, 79
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 100
LDI r7, 55
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
