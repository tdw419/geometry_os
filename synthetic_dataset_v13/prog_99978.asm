; DESCRIPTION: Draws a yellow rectangle at (299, 116) with width 93 and height 71.
; PLAN: r0=299(x), r1=116(y), r2=93(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 116
LDI r2, 93
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
