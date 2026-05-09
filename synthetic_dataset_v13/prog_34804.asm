; DESCRIPTION: Draws a yellow rectangle at (458, 76) with width 46 and height 11.
; PLAN: r0=458(x), r1=76(y), r2=46(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 76
LDI r2, 46
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
