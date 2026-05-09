; DESCRIPTION: Composite: Draws a magenta rectangle at (452, 23) with width 45 and height 78 then Places a yellow dot at position (283, 207).
; PLAN: r0=452(x), r1=23(y), r2=45(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x), r6=207(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 452
LDI r1, 23
LDI r2, 45
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 207
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
