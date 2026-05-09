; DESCRIPTION: Composite: Draws a orange rectangle at (173, 148) with width 52 and height 61 then Places a yellow dot at position (95, 102).
; PLAN: r0=173(x), r1=148(y), r2=52(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x), r6=102(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 173
LDI r1, 148
LDI r2, 52
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 102
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
