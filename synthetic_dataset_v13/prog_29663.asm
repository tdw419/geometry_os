; DESCRIPTION: Composite: Draws a green rectangle at (394, 170) with width 55 and height 85 then Draws a green circle centered at (434, 93) with radius 10.
; PLAN: r0=394(x), r1=170(y), r2=55(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x), r6=93(y), r7=10(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 394
LDI r1, 170
LDI r2, 55
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 93
LDI r7, 10
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
