; DESCRIPTION: Draws a cyan rectangle at (366, 27) with width 14 and height 11.
; PLAN: r0=366(x), r1=27(y), r2=14(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 27
LDI r2, 14
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
