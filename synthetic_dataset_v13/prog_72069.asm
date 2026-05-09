; DESCRIPTION: Draws a red rectangle at (449, 163) with width 15 and height 22.
; PLAN: r0=449(x), r1=163(y), r2=15(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 163
LDI r2, 15
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
