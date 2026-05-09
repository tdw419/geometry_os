; DESCRIPTION: Draws a green rectangle at (236, 48) with width 102 and height 111.
; PLAN: r0=236(x), r1=48(y), r2=102(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 48
LDI r2, 102
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
