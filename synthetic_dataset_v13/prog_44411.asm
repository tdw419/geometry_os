; DESCRIPTION: Draws a black rectangle at (207, 75) with width 48 and height 120.
; PLAN: r0=207(x), r1=75(y), r2=48(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 75
LDI r2, 48
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
