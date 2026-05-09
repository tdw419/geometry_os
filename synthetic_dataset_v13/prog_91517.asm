; DESCRIPTION: Draws a cyan rectangle at (444, 166) with width 15 and height 60.
; PLAN: r0=444(x), r1=166(y), r2=15(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 166
LDI r2, 15
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
