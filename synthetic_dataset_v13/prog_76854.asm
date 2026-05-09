; DESCRIPTION: Draws a cyan rectangle at (225, 153) with width 90 and height 97.
; PLAN: r0=225(x), r1=153(y), r2=90(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 153
LDI r2, 90
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
