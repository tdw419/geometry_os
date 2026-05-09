; DESCRIPTION: Draws a red rectangle at (73, 44) with width 96 and height 47.
; PLAN: r0=73(x), r1=44(y), r2=96(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 44
LDI r2, 96
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
