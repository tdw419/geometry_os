; DESCRIPTION: Draws a cyan rectangle at (74, 97) with width 57 and height 71.
; PLAN: r0=74(x), r1=97(y), r2=57(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 97
LDI r2, 57
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
