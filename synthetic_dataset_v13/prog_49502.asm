; DESCRIPTION: Draws a black rectangle at (4, 74) with width 82 and height 10.
; PLAN: r0=4(x), r1=74(y), r2=82(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 74
LDI r2, 82
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
