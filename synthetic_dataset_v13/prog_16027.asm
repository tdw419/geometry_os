; DESCRIPTION: Draws a black rectangle at (363, 188) with width 92 and height 10.
; PLAN: r0=363(x), r1=188(y), r2=92(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 188
LDI r2, 92
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
