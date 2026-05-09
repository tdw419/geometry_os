; DESCRIPTION: Draws a cyan rectangle at (12, 67) with width 40 and height 87.
; PLAN: r0=12(x), r1=67(y), r2=40(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 67
LDI r2, 40
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
