; DESCRIPTION: Draws a yellow rectangle at (43, 177) with width 102 and height 50.
; PLAN: r0=43(x), r1=177(y), r2=102(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 177
LDI r2, 102
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
