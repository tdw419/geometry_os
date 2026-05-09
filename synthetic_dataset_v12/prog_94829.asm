; DESCRIPTION: Draws a black rectangle at (221, 117) with width 90 and height 61.
; PLAN: r0=221(x), r1=117(y), r2=90(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 117
LDI r2, 90
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
