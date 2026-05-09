; DESCRIPTION: Draws a white rectangle at (56, 108) with width 61 and height 111.
; PLAN: r0=56(x), r1=108(y), r2=61(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 108
LDI r2, 61
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
