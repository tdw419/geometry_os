; DESCRIPTION: Composite: Draws a orange circle centered at (497, 118) with radius 15 then Places a green 56x51 rectangle at position (169, 120).
; PLAN: r0=497(x), r1=118(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=169(x), r6=120(y), r7=56(width), r8=51(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 497
LDI r1, 118
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 169
LDI r6, 120
LDI r7, 56
LDI r8, 51
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
