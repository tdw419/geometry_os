; DESCRIPTION: Draws a red rectangle at (211, 155) with width 56 and height 82.
; PLAN: r0=211(x), r1=155(y), r2=56(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 155
LDI r2, 56
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
