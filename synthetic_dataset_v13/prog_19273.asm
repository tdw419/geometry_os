; DESCRIPTION: Composite: Draws a green rectangle at (277, 73) with width 34 and height 22 then Draws a orange circle centered at (449, 75) with radius 42.
; PLAN: r0=277(x), r1=73(y), r2=34(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=449(x), r6=75(y), r7=42(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 277
LDI r1, 73
LDI r2, 34
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 75
LDI r7, 42
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
