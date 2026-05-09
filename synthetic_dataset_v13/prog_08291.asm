; DESCRIPTION: Draws a green rectangle at (380, 135) with width 89 and height 64.
; PLAN: r0=380(x), r1=135(y), r2=89(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 135
LDI r2, 89
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
