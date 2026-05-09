; DESCRIPTION: Composite: Draws a magenta rectangle at (392, 33) with width 96 and height 61 then Places a red dot at position (311, 2).
; PLAN: r0=392(x), r1=33(y), r2=96(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=311(x), r6=2(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 392
LDI r1, 33
LDI r2, 96
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 2
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
