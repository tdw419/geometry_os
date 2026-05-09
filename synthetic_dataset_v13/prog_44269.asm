; DESCRIPTION: Composite: Draws a orange rectangle at (92, 125) with width 111 and height 13 then Places a yellow dot at position (112, 194).
; PLAN: r0=92(x), r1=125(y), r2=111(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x), r6=194(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 92
LDI r1, 125
LDI r2, 111
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 194
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
