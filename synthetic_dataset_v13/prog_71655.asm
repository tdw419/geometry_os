; DESCRIPTION: Draws a cyan rectangle at (217, 14) with width 24 and height 106.
; PLAN: r0=217(x), r1=14(y), r2=24(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 14
LDI r2, 24
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
