; DESCRIPTION: Draws a black rectangle at (46, 30) with width 92 and height 60.
; PLAN: r0=46(x), r1=30(y), r2=92(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 30
LDI r2, 92
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
