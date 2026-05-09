; DESCRIPTION: Draws a white rectangle at (112, 147) with width 111 and height 11.
; PLAN: r0=112(x), r1=147(y), r2=111(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 147
LDI r2, 111
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
