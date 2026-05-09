; DESCRIPTION: Draws a yellow rectangle at (176, 62) with width 76 and height 85.
; PLAN: r0=176(x), r1=62(y), r2=76(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 62
LDI r2, 76
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
