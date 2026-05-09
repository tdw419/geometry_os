; DESCRIPTION: Draws a black rectangle at (276, 146) with width 108 and height 34.
; PLAN: r0=276(x), r1=146(y), r2=108(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 146
LDI r2, 108
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
