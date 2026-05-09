; DESCRIPTION: Draws a cyan rectangle at (47, 139) with width 53 and height 99.
; PLAN: r0=47(x), r1=139(y), r2=53(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 139
LDI r2, 53
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
