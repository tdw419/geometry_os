; DESCRIPTION: Draws a red rectangle at (365, 155) with width 22 and height 45.
; PLAN: r0=365(x), r1=155(y), r2=22(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 155
LDI r2, 22
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
