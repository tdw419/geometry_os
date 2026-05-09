; DESCRIPTION: Draws a cyan rectangle at (203, 53) with width 56 and height 68.
; PLAN: r0=203(x), r1=53(y), r2=56(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 53
LDI r2, 56
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
