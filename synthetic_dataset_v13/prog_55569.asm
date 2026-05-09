; DESCRIPTION: Draws a yellow rectangle at (429, 142) with width 52 and height 29.
; PLAN: r0=429(x), r1=142(y), r2=52(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 142
LDI r2, 52
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
