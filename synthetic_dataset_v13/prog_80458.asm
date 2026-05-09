; DESCRIPTION: Draws a green rectangle at (382, 61) with width 119 and height 120.
; PLAN: r0=382(x), r1=61(y), r2=119(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 61
LDI r2, 119
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
