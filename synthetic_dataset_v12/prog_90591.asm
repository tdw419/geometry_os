; DESCRIPTION: Draws a red rectangle at (309, 194) with width 35 and height 32.
; PLAN: r0=309(x), r1=194(y), r2=35(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 194
LDI r2, 35
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
