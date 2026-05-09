; DESCRIPTION: Composite: Draws a magenta rectangle at (11, 21) with width 81 and height 108 then Places a yellow dot at position (362, 117).
; PLAN: r0=11(x), r1=21(y), r2=81(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x), r6=117(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 11
LDI r1, 21
LDI r2, 81
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 117
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
