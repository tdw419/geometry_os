; DESCRIPTION: Draws a black rectangle at (433, 7) with width 34 and height 69.
; PLAN: r0=433(x), r1=7(y), r2=34(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 7
LDI r2, 34
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
