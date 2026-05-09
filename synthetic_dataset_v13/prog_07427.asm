; DESCRIPTION: Draws a red rectangle at (407, 75) with width 98 and height 82.
; PLAN: r0=407(x), r1=75(y), r2=98(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 75
LDI r2, 98
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
