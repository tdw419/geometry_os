; DESCRIPTION: Draws a red rectangle at (208, 76) with width 94 and height 105.
; PLAN: r0=208(x), r1=76(y), r2=94(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 76
LDI r2, 94
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
