; DESCRIPTION: Draws a blue rectangle at (362, 39) with width 71 and height 44.
; PLAN: r0=362(x), r1=39(y), r2=71(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 39
LDI r2, 71
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
