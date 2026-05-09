; DESCRIPTION: Draws a white rectangle at (326, 128) with width 102 and height 12.
; PLAN: r0=326(x), r1=128(y), r2=102(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 128
LDI r2, 102
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
