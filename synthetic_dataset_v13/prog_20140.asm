; DESCRIPTION: Draws a cyan rectangle at (263, 75) with width 114 and height 39.
; PLAN: r0=263(x), r1=75(y), r2=114(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 75
LDI r2, 114
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
