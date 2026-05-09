; DESCRIPTION: Draws a cyan rectangle at (216, 66) with width 87 and height 67.
; PLAN: r0=216(x), r1=66(y), r2=87(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 66
LDI r2, 87
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
