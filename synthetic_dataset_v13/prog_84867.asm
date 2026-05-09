; DESCRIPTION: Composite: Draws a magenta rectangle at (128, 52) with width 39 and height 84 then Places a yellow dot at position (50, 165).
; PLAN: r0=128(x), r1=52(y), r2=39(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=50(x), r6=165(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 128
LDI r1, 52
LDI r2, 39
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 165
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
