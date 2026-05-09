; DESCRIPTION: Draws a cyan rectangle at (295, 40) with width 97 and height 39.
; PLAN: r0=295(x), r1=40(y), r2=97(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 40
LDI r2, 97
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
