; DESCRIPTION: Draws a cyan rectangle at (313, 139) with width 79 and height 35.
; PLAN: r0=313(x), r1=139(y), r2=79(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 139
LDI r2, 79
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
