; DESCRIPTION: Draws a yellow rectangle at (322, 96) with width 48 and height 27.
; PLAN: r0=322(x), r1=96(y), r2=48(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 96
LDI r2, 48
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
