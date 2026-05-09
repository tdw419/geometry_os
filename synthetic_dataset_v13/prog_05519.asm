; DESCRIPTION: Draws a black rectangle at (208, 107) with width 111 and height 65.
; PLAN: r0=208(x), r1=107(y), r2=111(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 107
LDI r2, 111
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
