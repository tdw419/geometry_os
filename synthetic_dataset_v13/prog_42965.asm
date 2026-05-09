; DESCRIPTION: Draws a yellow rectangle at (199, 73) with width 68 and height 34.
; PLAN: r0=199(x), r1=73(y), r2=68(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 73
LDI r2, 68
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
