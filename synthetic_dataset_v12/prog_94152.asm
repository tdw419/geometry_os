; DESCRIPTION: Draws a white rectangle at (8, 71) with width 49 and height 44.
; PLAN: r0=8(x), r1=71(y), r2=49(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 71
LDI r2, 49
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
