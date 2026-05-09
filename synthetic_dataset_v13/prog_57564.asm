; DESCRIPTION: Draws a purple rectangle at (403, 111) with width 91 and height 107.
; PLAN: r0=403(x), r1=111(y), r2=91(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 111
LDI r2, 91
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
