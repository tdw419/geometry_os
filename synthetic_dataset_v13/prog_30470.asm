; DESCRIPTION: Draws a orange rectangle at (255, 25) with width 89 and height 24.
; PLAN: r0=255(x), r1=25(y), r2=89(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 25
LDI r2, 89
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
