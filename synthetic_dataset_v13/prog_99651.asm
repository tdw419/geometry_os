; DESCRIPTION: Draws a yellow rectangle at (352, 90) with width 36 and height 72.
; PLAN: r0=352(x), r1=90(y), r2=36(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 90
LDI r2, 36
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
