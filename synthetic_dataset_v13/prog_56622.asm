; DESCRIPTION: Draws a yellow rectangle at (164, 80) with width 39 and height 112.
; PLAN: r0=164(x), r1=80(y), r2=39(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 80
LDI r2, 39
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
