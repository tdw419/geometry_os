; DESCRIPTION: Draws a red rectangle at (129, 142) with width 84 and height 16.
; PLAN: r0=129(x), r1=142(y), r2=84(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 142
LDI r2, 84
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
