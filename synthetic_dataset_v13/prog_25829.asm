; DESCRIPTION: Draws a black rectangle at (333, 68) with width 90 and height 79.
; PLAN: r0=333(x), r1=68(y), r2=90(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 68
LDI r2, 90
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
