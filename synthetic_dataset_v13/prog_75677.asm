; DESCRIPTION: Draws a red rectangle at (254, 82) with width 72 and height 116.
; PLAN: r0=254(x), r1=82(y), r2=72(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 82
LDI r2, 72
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
