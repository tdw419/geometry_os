; DESCRIPTION: Draws a white rectangle at (35, 92) with width 93 and height 93.
; PLAN: r0=35(x), r1=92(y), r2=93(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 92
LDI r2, 93
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
