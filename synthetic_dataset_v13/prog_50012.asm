; DESCRIPTION: Draws a yellow rectangle at (367, 13) with width 82 and height 38.
; PLAN: r0=367(x), r1=13(y), r2=82(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 13
LDI r2, 82
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
