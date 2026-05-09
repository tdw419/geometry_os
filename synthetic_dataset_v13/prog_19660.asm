; DESCRIPTION: Draws a yellow rectangle at (392, 122) with width 58 and height 39.
; PLAN: r0=392(x), r1=122(y), r2=58(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 122
LDI r2, 58
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
