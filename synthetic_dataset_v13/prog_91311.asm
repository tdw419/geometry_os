; DESCRIPTION: Draws a black rectangle at (243, 62) with width 76 and height 58.
; PLAN: r0=243(x), r1=62(y), r2=76(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 62
LDI r2, 76
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
