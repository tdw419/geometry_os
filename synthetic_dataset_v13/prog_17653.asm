; DESCRIPTION: Draws a black rectangle at (380, 31) with width 47 and height 71.
; PLAN: r0=380(x), r1=31(y), r2=47(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 31
LDI r2, 47
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
