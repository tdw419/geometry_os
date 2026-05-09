; DESCRIPTION: Draws a cyan rectangle at (24, 69) with width 53 and height 90.
; PLAN: r0=24(x), r1=69(y), r2=53(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 69
LDI r2, 53
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
