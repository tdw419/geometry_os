; DESCRIPTION: Draws a green rectangle at (35, 128) with width 111 and height 64.
; PLAN: r0=35(x), r1=128(y), r2=111(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 128
LDI r2, 111
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
