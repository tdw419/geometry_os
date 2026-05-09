; DESCRIPTION: Draws a green rectangle at (30, 69) with width 74 and height 120.
; PLAN: r0=30(x), r1=69(y), r2=74(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 69
LDI r2, 74
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
