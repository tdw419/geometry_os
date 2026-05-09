; DESCRIPTION: Draws a orange rectangle at (125, 57) with width 93 and height 73.
; PLAN: r0=125(x), r1=57(y), r2=93(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 57
LDI r2, 93
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
