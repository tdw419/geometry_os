; DESCRIPTION: Draws a white rectangle at (235, 128) with width 111 and height 13.
; PLAN: r0=235(x), r1=128(y), r2=111(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 128
LDI r2, 111
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
