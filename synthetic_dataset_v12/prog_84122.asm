; DESCRIPTION: Draws a red rectangle at (310, 3) with width 10 and height 120.
; PLAN: r0=310(x), r1=3(y), r2=10(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 3
LDI r2, 10
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
