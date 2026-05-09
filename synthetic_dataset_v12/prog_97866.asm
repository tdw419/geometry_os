; DESCRIPTION: Draws a yellow rectangle at (181, 126) with width 107 and height 30.
; PLAN: r0=181(x), r1=126(y), r2=107(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 126
LDI r2, 107
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
