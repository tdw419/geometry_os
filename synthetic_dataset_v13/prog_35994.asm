; DESCRIPTION: Draws a cyan rectangle at (390, 59) with width 19 and height 16.
; PLAN: r0=390(x), r1=59(y), r2=19(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 59
LDI r2, 19
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
