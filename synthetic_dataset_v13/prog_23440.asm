; DESCRIPTION: Draws a orange rectangle at (287, 111) with width 82 and height 84.
; PLAN: r0=287(x), r1=111(y), r2=82(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 111
LDI r2, 82
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
