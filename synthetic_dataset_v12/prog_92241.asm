; DESCRIPTION: Draws a white rectangle at (140, 82) with width 67 and height 33.
; PLAN: r0=140(x), r1=82(y), r2=67(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 82
LDI r2, 67
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
