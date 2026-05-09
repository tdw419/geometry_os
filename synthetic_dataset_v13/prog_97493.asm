; DESCRIPTION: Draws a yellow rectangle at (402, 48) with width 67 and height 108.
; PLAN: r0=402(x), r1=48(y), r2=67(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 48
LDI r2, 67
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
