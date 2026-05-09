; DESCRIPTION: Draws a orange rectangle at (21, 146) with width 81 and height 39.
; PLAN: r0=21(x), r1=146(y), r2=81(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 146
LDI r2, 81
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
