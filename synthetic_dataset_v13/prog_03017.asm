; DESCRIPTION: Composite: Draws a red rectangle at (400, 26) with width 62 and height 18 then Places a orange circle of radius 65 at center (209, 153).
; PLAN: r0=400(x), r1=26(y), r2=62(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x), r6=153(y), r7=65(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 400
LDI r1, 26
LDI r2, 62
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 153
LDI r7, 65
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
