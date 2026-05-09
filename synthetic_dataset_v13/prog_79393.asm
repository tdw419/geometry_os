; DESCRIPTION: Draws a white rectangle at (121, 32) with width 99 and height 98.
; PLAN: r0=121(x), r1=32(y), r2=99(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 32
LDI r2, 99
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
