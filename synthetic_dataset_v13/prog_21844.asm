; DESCRIPTION: Draws a black rectangle at (177, 68) with width 18 and height 57.
; PLAN: r0=177(x), r1=68(y), r2=18(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 68
LDI r2, 18
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
