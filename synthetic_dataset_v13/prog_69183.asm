; DESCRIPTION: Draws a yellow rectangle at (126, 87) with width 67 and height 89.
; PLAN: r0=126(x), r1=87(y), r2=67(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 87
LDI r2, 67
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
