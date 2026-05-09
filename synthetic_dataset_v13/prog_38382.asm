; DESCRIPTION: Draws a black rectangle at (34, 126) with width 37 and height 52.
; PLAN: r0=34(x), r1=126(y), r2=37(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 126
LDI r2, 37
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
