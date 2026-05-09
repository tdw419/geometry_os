; DESCRIPTION: Draws a red rectangle at (345, 60) with width 73 and height 119.
; PLAN: r0=345(x), r1=60(y), r2=73(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 60
LDI r2, 73
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
