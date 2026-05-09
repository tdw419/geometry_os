; DESCRIPTION: Draws a white rectangle at (237, 6) with width 101 and height 111.
; PLAN: r0=237(x), r1=6(y), r2=101(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 6
LDI r2, 101
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
