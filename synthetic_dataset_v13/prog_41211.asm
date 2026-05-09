; DESCRIPTION: Draws a cyan rectangle at (436, 115) with width 74 and height 53.
; PLAN: r0=436(x), r1=115(y), r2=74(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 115
LDI r2, 74
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
