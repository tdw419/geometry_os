; DESCRIPTION: Draws a black rectangle at (276, 61) with width 82 and height 91.
; PLAN: r0=276(x), r1=61(y), r2=82(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 61
LDI r2, 82
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
