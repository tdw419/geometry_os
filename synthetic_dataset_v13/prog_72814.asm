; DESCRIPTION: Draws a black rectangle at (417, 39) with width 93 and height 56.
; PLAN: r0=417(x), r1=39(y), r2=93(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 39
LDI r2, 93
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
