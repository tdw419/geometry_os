; DESCRIPTION: Draws a red rectangle at (282, 149) with width 39 and height 52.
; PLAN: r0=282(x), r1=149(y), r2=39(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 149
LDI r2, 39
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
