; DESCRIPTION: Draws a black rectangle at (172, 128) with width 37 and height 93.
; PLAN: r0=172(x), r1=128(y), r2=37(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 128
LDI r2, 37
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
