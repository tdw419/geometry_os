; DESCRIPTION: Draws a black rectangle at (429, 47) with width 31 and height 92.
; PLAN: r0=429(x), r1=47(y), r2=31(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 47
LDI r2, 31
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
