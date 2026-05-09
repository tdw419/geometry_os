; DESCRIPTION: Draws a yellow rectangle at (191, 93) with width 116 and height 85.
; PLAN: r0=191(x), r1=93(y), r2=116(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 93
LDI r2, 116
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
