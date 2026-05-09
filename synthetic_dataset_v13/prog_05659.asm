; DESCRIPTION: Draws a cyan rectangle at (261, 59) with width 59 and height 47.
; PLAN: r0=261(x), r1=59(y), r2=59(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 59
LDI r2, 59
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
