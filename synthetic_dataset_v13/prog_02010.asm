; DESCRIPTION: Draws a red rectangle at (367, 115) with width 57 and height 116.
; PLAN: r0=367(x), r1=115(y), r2=57(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 115
LDI r2, 57
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
