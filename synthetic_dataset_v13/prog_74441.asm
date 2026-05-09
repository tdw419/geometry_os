; DESCRIPTION: Draws a cyan rectangle at (315, 90) with width 100 and height 99.
; PLAN: r0=315(x), r1=90(y), r2=100(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 90
LDI r2, 100
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
