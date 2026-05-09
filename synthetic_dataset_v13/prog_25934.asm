; DESCRIPTION: Composite: Draws a purple rectangle at (393, 151) with width 63 and height 77 then Places a red dot at position (291, 228).
; PLAN: r0=393(x), r1=151(y), r2=63(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x), r6=228(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 393
LDI r1, 151
LDI r2, 63
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 228
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
