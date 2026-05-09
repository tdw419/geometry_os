; DESCRIPTION: Draws a cyan rectangle at (35, 35) with width 56 and height 85.
; PLAN: r0=35(x), r1=35(y), r2=56(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 35
LDI r2, 56
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
