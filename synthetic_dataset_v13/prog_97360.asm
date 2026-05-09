; DESCRIPTION: Draws a red rectangle at (351, 117) with width 14 and height 92.
; PLAN: r0=351(x), r1=117(y), r2=14(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 117
LDI r2, 14
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
