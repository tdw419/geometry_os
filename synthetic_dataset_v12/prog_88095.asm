; DESCRIPTION: Draws a white rectangle at (322, 110) with width 37 and height 32.
; PLAN: r0=322(x), r1=110(y), r2=37(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 110
LDI r2, 37
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
