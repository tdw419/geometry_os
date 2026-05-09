; DESCRIPTION: Draws a cyan rectangle at (14, 59) with width 20 and height 37.
; PLAN: r0=14(x), r1=59(y), r2=20(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 59
LDI r2, 20
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
