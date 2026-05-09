; DESCRIPTION: Draws a cyan rectangle at (217, 39) with width 105 and height 81.
; PLAN: r0=217(x), r1=39(y), r2=105(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 39
LDI r2, 105
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
