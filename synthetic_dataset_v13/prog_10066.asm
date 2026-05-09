; DESCRIPTION: Draws a black rectangle at (365, 17) with width 103 and height 98.
; PLAN: r0=365(x), r1=17(y), r2=103(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 17
LDI r2, 103
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
