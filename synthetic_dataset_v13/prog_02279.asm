; DESCRIPTION: Composite: Draws a orange circle centered at (384, 162) with radius 59 then Creates a orange rectangular region at (20, 189) spanning 50 by 28 pixels.
; PLAN: r0=384(x), r1=162(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=189(y), r7=50(width), r8=28(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 384
LDI r1, 162
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 189
LDI r7, 50
LDI r8, 28
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
