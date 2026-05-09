; DESCRIPTION: Draws a yellow rectangle at (74, 171) with width 64 and height 85.
; PLAN: r0=74(x), r1=171(y), r2=64(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 171
LDI r2, 64
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
