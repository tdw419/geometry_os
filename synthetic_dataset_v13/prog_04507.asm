; DESCRIPTION: Draws a white rectangle at (125, 67) with width 98 and height 111.
; PLAN: r0=125(x), r1=67(y), r2=98(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 67
LDI r2, 98
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
