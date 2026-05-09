; DESCRIPTION: Draws a yellow rectangle at (107, 45) with width 61 and height 101.
; PLAN: r0=107(x), r1=45(y), r2=61(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 45
LDI r2, 61
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
