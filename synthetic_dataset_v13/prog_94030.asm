; DESCRIPTION: Draws a orange rectangle at (57, 221) with width 18 and height 30.
; PLAN: r0=57(x), r1=221(y), r2=18(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 221
LDI r2, 18
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
