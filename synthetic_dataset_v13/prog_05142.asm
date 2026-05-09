; DESCRIPTION: Draws a black rectangle at (103, 75) with width 120 and height 105.
; PLAN: r0=103(x), r1=75(y), r2=120(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 75
LDI r2, 120
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
