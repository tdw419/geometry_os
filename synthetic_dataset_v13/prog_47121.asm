; DESCRIPTION: Draws a red rectangle at (489, 164) with width 17 and height 62.
; PLAN: r0=489(x), r1=164(y), r2=17(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 164
LDI r2, 17
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
