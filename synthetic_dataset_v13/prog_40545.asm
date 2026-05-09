; DESCRIPTION: Draws a green rectangle at (30, 32) with width 46 and height 33.
; PLAN: r0=30(x), r1=32(y), r2=46(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 32
LDI r2, 46
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
