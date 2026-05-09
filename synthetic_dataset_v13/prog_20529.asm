; DESCRIPTION: Draws a orange rectangle at (358, 34) with width 25 and height 64.
; PLAN: r0=358(x), r1=34(y), r2=25(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 34
LDI r2, 25
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
