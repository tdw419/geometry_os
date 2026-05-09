; DESCRIPTION: Draws a green rectangle at (16, 151) with width 32 and height 89.
; PLAN: r0=16(x), r1=151(y), r2=32(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 151
LDI r2, 32
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
