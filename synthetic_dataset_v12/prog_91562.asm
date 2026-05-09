; DESCRIPTION: Draws a yellow rectangle at (182, 33) with width 76 and height 51.
; PLAN: r0=182(x), r1=33(y), r2=76(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 33
LDI r2, 76
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
