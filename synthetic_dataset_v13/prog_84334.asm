; DESCRIPTION: Draws a yellow rectangle at (449, 107) with width 35 and height 117.
; PLAN: r0=449(x), r1=107(y), r2=35(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 107
LDI r2, 35
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
