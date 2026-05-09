; DESCRIPTION: Draws a white rectangle at (29, 0) with width 11 and height 111.
; PLAN: r0=29(x), r1=0(y), r2=11(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 0
LDI r2, 11
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
