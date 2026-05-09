; DESCRIPTION: Draws a red rectangle at (336, 83) with width 75 and height 72.
; PLAN: r0=336(x), r1=83(y), r2=75(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 83
LDI r2, 75
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
