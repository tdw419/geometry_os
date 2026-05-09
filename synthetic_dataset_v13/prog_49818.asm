; DESCRIPTION: Draws a green rectangle at (425, 121) with width 82 and height 33.
; PLAN: r0=425(x), r1=121(y), r2=82(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 121
LDI r2, 82
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
