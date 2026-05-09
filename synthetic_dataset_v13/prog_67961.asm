; DESCRIPTION: Draws a yellow rectangle at (73, 153) with width 76 and height 93.
; PLAN: r0=73(x), r1=153(y), r2=76(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 153
LDI r2, 76
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
