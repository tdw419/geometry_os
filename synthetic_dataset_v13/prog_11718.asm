; DESCRIPTION: Draws a red rectangle at (322, 198) with width 64 and height 27.
; PLAN: r0=322(x), r1=198(y), r2=64(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 198
LDI r2, 64
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
