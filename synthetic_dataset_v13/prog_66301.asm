; DESCRIPTION: Composite: Draws a black rectangle at (247, 159) with width 74 and height 32 then Sets a single magenta pixel at (445, 222).
; PLAN: r0=247(x), r1=159(y), r2=74(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x), r6=222(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 247
LDI r1, 159
LDI r2, 74
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 222
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
