; DESCRIPTION: Composite: Draws a orange rectangle at (95, 166) with width 98 and height 89 then Draws a yellow circle centered at (61, 96) with radius 55.
; PLAN: r0=95(x), r1=166(y), r2=98(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=61(x), r6=96(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 95
LDI r1, 166
LDI r2, 98
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 96
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
