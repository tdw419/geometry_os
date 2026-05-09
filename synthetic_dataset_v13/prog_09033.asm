; DESCRIPTION: Draws a red rectangle at (143, 123) with width 70 and height 82.
; PLAN: r0=143(x), r1=123(y), r2=70(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 123
LDI r2, 70
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
