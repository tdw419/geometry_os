; DESCRIPTION: Draws a cyan rectangle at (366, 35) with width 77 and height 61.
; PLAN: r0=366(x), r1=35(y), r2=77(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 35
LDI r2, 77
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
