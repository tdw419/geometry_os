; DESCRIPTION: Draws a green rectangle at (330, 140) with width 57 and height 111.
; PLAN: r0=330(x), r1=140(y), r2=57(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 140
LDI r2, 57
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
