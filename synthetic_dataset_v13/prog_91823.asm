; DESCRIPTION: Draws a red rectangle at (420, 181) with width 76 and height 50.
; PLAN: r0=420(x), r1=181(y), r2=76(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 181
LDI r2, 76
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
