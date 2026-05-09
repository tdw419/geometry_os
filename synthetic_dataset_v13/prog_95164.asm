; DESCRIPTION: Draws a cyan rectangle at (62, 3) with width 12 and height 77.
; PLAN: r0=62(x), r1=3(y), r2=12(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 3
LDI r2, 12
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
