; DESCRIPTION: Draws a black rectangle at (323, 61) with width 46 and height 112.
; PLAN: r0=323(x), r1=61(y), r2=46(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 61
LDI r2, 46
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
