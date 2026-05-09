; DESCRIPTION: Draws a cyan rectangle at (171, 192) with width 119 and height 53.
; PLAN: r0=171(x), r1=192(y), r2=119(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 192
LDI r2, 119
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
