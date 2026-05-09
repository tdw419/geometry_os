; DESCRIPTION: Draws a yellow rectangle at (371, 87) with width 76 and height 90.
; PLAN: r0=371(x), r1=87(y), r2=76(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 87
LDI r2, 76
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
