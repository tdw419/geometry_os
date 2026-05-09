; DESCRIPTION: Draws a cyan rectangle at (338, 153) with width 119 and height 80.
; PLAN: r0=338(x), r1=153(y), r2=119(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 153
LDI r2, 119
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
