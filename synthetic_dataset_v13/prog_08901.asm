; DESCRIPTION: Draws a cyan rectangle at (485, 119) with width 10 and height 107.
; PLAN: r0=485(x), r1=119(y), r2=10(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 119
LDI r2, 10
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
