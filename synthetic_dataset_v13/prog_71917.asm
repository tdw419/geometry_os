; DESCRIPTION: Draws a white rectangle at (91, 26) with width 111 and height 14.
; PLAN: r0=91(x), r1=26(y), r2=111(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 26
LDI r2, 111
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
