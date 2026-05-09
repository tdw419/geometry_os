; DESCRIPTION: Composite: Draws a orange circle centered at (434, 83) with radius 55 then Renders a orange box of size 59x49 starting at (324, 127).
; PLAN: r0=434(x), r1=83(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=324(x), r6=127(y), r7=59(width), r8=49(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 434
LDI r1, 83
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 324
LDI r6, 127
LDI r7, 59
LDI r8, 49
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
