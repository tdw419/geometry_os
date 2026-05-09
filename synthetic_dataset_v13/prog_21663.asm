; DESCRIPTION: Draws a yellow rectangle at (160, 107) with width 95 and height 74.
; PLAN: r0=160(x), r1=107(y), r2=95(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 107
LDI r2, 95
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
