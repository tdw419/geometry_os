; DESCRIPTION: Draws a black rectangle at (46, 138) with width 60 and height 111.
; PLAN: r0=46(x), r1=138(y), r2=60(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 138
LDI r2, 60
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
