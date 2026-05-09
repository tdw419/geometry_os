; DESCRIPTION: Draws a red rectangle at (45, 73) with width 53 and height 33.
; PLAN: r0=45(x), r1=73(y), r2=53(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 73
LDI r2, 53
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
