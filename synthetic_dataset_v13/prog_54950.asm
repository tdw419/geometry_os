; DESCRIPTION: Composite: Renders a red disk with center (197, 103) and radius 50 then Draws a orange rectangle at (378, 135) with width 89 and height 56.
; PLAN: r0=197(x), r1=103(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=378(x), r6=135(y), r7=89(width), r8=56(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 103
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 378
LDI r6, 135
LDI r7, 89
LDI r8, 56
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
