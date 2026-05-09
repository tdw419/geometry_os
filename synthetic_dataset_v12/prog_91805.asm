; DESCRIPTION: Draws a cyan rectangle at (153, 109) with width 31 and height 99.
; PLAN: r0=153(x), r1=109(y), r2=31(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 109
LDI r2, 31
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
