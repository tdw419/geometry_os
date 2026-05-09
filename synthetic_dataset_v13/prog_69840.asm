; DESCRIPTION: Draws a green rectangle at (356, 61) with width 71 and height 111.
; PLAN: r0=356(x), r1=61(y), r2=71(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 61
LDI r2, 71
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
