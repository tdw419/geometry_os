; DESCRIPTION: Draws a cyan rectangle at (234, 174) with width 35 and height 12.
; PLAN: r0=234(x), r1=174(y), r2=35(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 174
LDI r2, 35
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
