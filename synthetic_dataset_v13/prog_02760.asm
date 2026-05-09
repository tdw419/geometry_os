; DESCRIPTION: Draws a red rectangle at (467, 135) with width 22 and height 53.
; PLAN: r0=467(x), r1=135(y), r2=22(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 135
LDI r2, 22
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
