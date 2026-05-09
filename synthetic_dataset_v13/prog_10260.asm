; DESCRIPTION: Draws a blue rectangle at (61, 115) with width 58 and height 77.
; PLAN: r0=61(x), r1=115(y), r2=58(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 115
LDI r2, 58
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
