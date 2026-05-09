; DESCRIPTION: Draws a black rectangle at (349, 168) with width 66 and height 55.
; PLAN: r0=349(x), r1=168(y), r2=66(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 168
LDI r2, 66
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
