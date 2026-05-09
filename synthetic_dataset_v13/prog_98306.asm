; DESCRIPTION: Draws a red rectangle at (351, 10) with width 71 and height 76.
; PLAN: r0=351(x), r1=10(y), r2=71(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 10
LDI r2, 71
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
