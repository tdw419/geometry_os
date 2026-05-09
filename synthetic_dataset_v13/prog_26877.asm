; DESCRIPTION: Draws a cyan rectangle at (366, 92) with width 31 and height 97.
; PLAN: r0=366(x), r1=92(y), r2=31(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 92
LDI r2, 31
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
