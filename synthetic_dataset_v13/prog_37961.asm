; DESCRIPTION: Draws a orange rectangle at (377, 146) with width 113 and height 28.
; PLAN: r0=377(x), r1=146(y), r2=113(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 146
LDI r2, 113
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
