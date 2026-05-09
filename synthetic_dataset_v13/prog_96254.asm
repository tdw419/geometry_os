; DESCRIPTION: Draws a orange rectangle at (389, 74) with width 84 and height 113.
; PLAN: r0=389(x), r1=74(y), r2=84(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 74
LDI r2, 84
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
