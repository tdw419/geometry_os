; DESCRIPTION: Draws a cyan rectangle at (383, 96) with width 66 and height 112.
; PLAN: r0=383(x), r1=96(y), r2=66(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 96
LDI r2, 66
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
