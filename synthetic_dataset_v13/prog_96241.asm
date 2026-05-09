; DESCRIPTION: Draws a yellow rectangle at (29, 137) with width 86 and height 82.
; PLAN: r0=29(x), r1=137(y), r2=86(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 137
LDI r2, 86
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
