; DESCRIPTION: Draws a cyan rectangle at (114, 86) with width 114 and height 53.
; PLAN: r0=114(x), r1=86(y), r2=114(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 86
LDI r2, 114
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
