; DESCRIPTION: Draws a red rectangle at (324, 40) with width 10 and height 90.
; PLAN: r0=324(x), r1=40(y), r2=10(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 40
LDI r2, 10
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
