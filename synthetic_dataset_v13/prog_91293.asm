; DESCRIPTION: Draws a red rectangle at (285, 116) with width 107 and height 95.
; PLAN: r0=285(x), r1=116(y), r2=107(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 116
LDI r2, 107
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
