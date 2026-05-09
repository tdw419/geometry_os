; DESCRIPTION: Draws a red rectangle at (322, 25) with width 118 and height 14.
; PLAN: r0=322(x), r1=25(y), r2=118(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 25
LDI r2, 118
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
