; DESCRIPTION: Draws a red rectangle at (313, 97) with width 14 and height 79.
; PLAN: r0=313(x), r1=97(y), r2=14(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 97
LDI r2, 14
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
