; DESCRIPTION: Draws a cyan rectangle at (399, 52) with width 108 and height 67.
; PLAN: r0=399(x), r1=52(y), r2=108(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 52
LDI r2, 108
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
