; DESCRIPTION: Draws a yellow rectangle at (256, 108) with width 49 and height 50.
; PLAN: r0=256(x), r1=108(y), r2=49(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 108
LDI r2, 49
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
