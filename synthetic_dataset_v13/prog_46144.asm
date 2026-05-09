; DESCRIPTION: Composite: Draws a magenta rectangle at (262, 39) with width 101 and height 101 then Places a purple dot at position (82, 190).
; PLAN: r0=262(x), r1=39(y), r2=101(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=82(x), r6=190(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 262
LDI r1, 39
LDI r2, 101
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 190
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
