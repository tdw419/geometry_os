; DESCRIPTION: Draws a cyan rectangle at (89, 122) with width 59 and height 24.
; PLAN: r0=89(x), r1=122(y), r2=59(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 122
LDI r2, 59
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
