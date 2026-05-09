; DESCRIPTION: Draws a orange rectangle at (434, 0) with width 14 and height 83.
; PLAN: r0=434(x), r1=0(y), r2=14(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 0
LDI r2, 14
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
