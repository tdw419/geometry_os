; DESCRIPTION: Draws a cyan rectangle at (47, 43) with width 115 and height 64.
; PLAN: r0=47(x), r1=43(y), r2=115(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 43
LDI r2, 115
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
