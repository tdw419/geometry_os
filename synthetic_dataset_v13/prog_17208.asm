; DESCRIPTION: Draws a green rectangle at (53, 79) with width 116 and height 93.
; PLAN: r0=53(x), r1=79(y), r2=116(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 79
LDI r2, 116
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
