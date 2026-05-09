; DESCRIPTION: Draws a red rectangle at (409, 125) with width 29 and height 72.
; PLAN: r0=409(x), r1=125(y), r2=29(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 125
LDI r2, 29
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
