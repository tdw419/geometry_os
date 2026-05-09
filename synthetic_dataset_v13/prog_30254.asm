; DESCRIPTION: Draws a cyan rectangle at (94, 9) with width 23 and height 59.
; PLAN: r0=94(x), r1=9(y), r2=23(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 9
LDI r2, 23
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
