; DESCRIPTION: Draws a white rectangle at (159, 196) with width 111 and height 46.
; PLAN: r0=159(x), r1=196(y), r2=111(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 196
LDI r2, 111
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
