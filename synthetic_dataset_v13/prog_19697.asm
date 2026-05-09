; DESCRIPTION: Composite: Places a red 119x63 rectangle at position (362, 92) then Draws a orange circle centered at (342, 172) with radius 52.
; PLAN: r0=362(x), r1=92(y), r2=119(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x), r6=172(y), r7=52(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 362
LDI r1, 92
LDI r2, 119
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 172
LDI r7, 52
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
