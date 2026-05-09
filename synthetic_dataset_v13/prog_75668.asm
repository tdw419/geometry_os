; DESCRIPTION: Composite: Draws a magenta rectangle at (157, 183) with width 90 and height 50 then Places a black dot at position (243, 239).
; PLAN: r0=157(x), r1=183(y), r2=90(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x), r6=239(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 157
LDI r1, 183
LDI r2, 90
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 239
LDI r7, 0x000000
PSET r5, r6, r7
HALT
