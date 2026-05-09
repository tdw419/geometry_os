; DESCRIPTION: Draws a red rectangle at (76, 215) with width 78 and height 13.
; PLAN: r0=76(x), r1=215(y), r2=78(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 215
LDI r2, 78
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
