; DESCRIPTION: Draws a yellow rectangle at (458, 0) with width 10 and height 101.
; PLAN: r0=458(x), r1=0(y), r2=10(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 0
LDI r2, 10
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
