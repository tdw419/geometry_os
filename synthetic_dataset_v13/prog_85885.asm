; DESCRIPTION: Draws a purple rectangle at (304, 52) with width 77 and height 95.
; PLAN: r0=304(x), r1=52(y), r2=77(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 52
LDI r2, 77
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
