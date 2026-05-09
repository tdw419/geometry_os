; DESCRIPTION: Draws a yellow rectangle at (423, 238) with width 14 and height 18.
; PLAN: r0=423(x), r1=238(y), r2=14(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 238
LDI r2, 14
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
