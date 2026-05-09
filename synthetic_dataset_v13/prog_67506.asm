; DESCRIPTION: Composite: Creates a blue circular shape at (433, 151) with radius 10 then Draws a green rectangle at (342, 10) with width 109 and height 45.
; PLAN: r0=433(x), r1=151(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x), r6=10(y), r7=109(width), r8=45(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 151
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 10
LDI r7, 109
LDI r8, 45
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
