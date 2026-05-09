; DESCRIPTION: Draws a white rectangle at (396, 128) with width 64 and height 46.
; PLAN: r0=396(x), r1=128(y), r2=64(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 128
LDI r2, 64
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
