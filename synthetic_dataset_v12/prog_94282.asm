; DESCRIPTION: Draws a yellow rectangle at (365, 7) with width 83 and height 67.
; PLAN: r0=365(x), r1=7(y), r2=83(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 7
LDI r2, 83
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
