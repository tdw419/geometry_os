; DESCRIPTION: Draws a green rectangle at (32, 73) with width 21 and height 115.
; PLAN: r0=32(x), r1=73(y), r2=21(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 73
LDI r2, 21
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
