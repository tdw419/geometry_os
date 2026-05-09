; DESCRIPTION: Draws a yellow rectangle at (159, 171) with width 39 and height 60.
; PLAN: r0=159(x), r1=171(y), r2=39(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 171
LDI r2, 39
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
