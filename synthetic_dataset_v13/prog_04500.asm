; DESCRIPTION: Draws a green rectangle at (367, 73) with width 58 and height 19.
; PLAN: r0=367(x), r1=73(y), r2=58(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 73
LDI r2, 58
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
