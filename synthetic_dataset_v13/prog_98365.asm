; DESCRIPTION: Draws a red rectangle at (367, 76) with width 10 and height 49.
; PLAN: r0=367(x), r1=76(y), r2=10(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 76
LDI r2, 10
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
