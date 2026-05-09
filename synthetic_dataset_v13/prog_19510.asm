; DESCRIPTION: Draws a black rectangle at (313, 82) with width 85 and height 112.
; PLAN: r0=313(x), r1=82(y), r2=85(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 82
LDI r2, 85
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
