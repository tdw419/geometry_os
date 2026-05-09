; DESCRIPTION: Draws a cyan rectangle at (98, 39) with width 84 and height 74.
; PLAN: r0=98(x), r1=39(y), r2=84(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 39
LDI r2, 84
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
