; DESCRIPTION: Composite: Draws a red rectangle at (340, 166) with width 92 and height 56 then Places a purple dot at position (131, 80).
; PLAN: r0=340(x), r1=166(y), r2=92(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x), r6=80(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 340
LDI r1, 166
LDI r2, 92
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 80
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
