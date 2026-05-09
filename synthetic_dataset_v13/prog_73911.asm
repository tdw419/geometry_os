; DESCRIPTION: Draws a black rectangle at (389, 12) with width 32 and height 111.
; PLAN: r0=389(x), r1=12(y), r2=32(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 12
LDI r2, 32
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
