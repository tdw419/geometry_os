; DESCRIPTION: Draws a white rectangle at (230, 127) with width 44 and height 103.
; PLAN: r0=230(x), r1=127(y), r2=44(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 127
LDI r2, 44
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
