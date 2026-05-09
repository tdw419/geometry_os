; DESCRIPTION: Draws a green rectangle at (202, 111) with width 112 and height 29.
; PLAN: r0=202(x), r1=111(y), r2=112(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 111
LDI r2, 112
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
