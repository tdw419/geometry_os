; DESCRIPTION: Draws a black rectangle at (214, 206) with width 66 and height 23.
; PLAN: r0=214(x), r1=206(y), r2=66(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 206
LDI r2, 66
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
