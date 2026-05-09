; DESCRIPTION: Draws a cyan rectangle at (74, 107) with width 53 and height 101.
; PLAN: r0=74(x), r1=107(y), r2=53(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 107
LDI r2, 53
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
