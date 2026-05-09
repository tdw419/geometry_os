; DESCRIPTION: Draws a red rectangle at (84, 155) with width 57 and height 16.
; PLAN: r0=84(x), r1=155(y), r2=57(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 155
LDI r2, 57
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
