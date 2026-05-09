; DESCRIPTION: Draws a orange rectangle at (434, 89) with width 53 and height 78.
; PLAN: r0=434(x), r1=89(y), r2=53(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 89
LDI r2, 53
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
