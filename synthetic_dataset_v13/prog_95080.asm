; DESCRIPTION: Draws a red rectangle at (366, 57) with width 107 and height 62.
; PLAN: r0=366(x), r1=57(y), r2=107(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 57
LDI r2, 107
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
