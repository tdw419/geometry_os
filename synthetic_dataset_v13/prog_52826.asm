; DESCRIPTION: Draws a orange rectangle at (296, 4) with width 12 and height 57.
; PLAN: r0=296(x), r1=4(y), r2=12(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 4
LDI r2, 12
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
