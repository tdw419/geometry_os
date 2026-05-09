; DESCRIPTION: Draws a green rectangle at (238, 233) with width 48 and height 19.
; PLAN: r0=238(x), r1=233(y), r2=48(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 233
LDI r2, 48
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
