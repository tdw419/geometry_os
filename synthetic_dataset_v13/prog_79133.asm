; DESCRIPTION: Draws a cyan rectangle at (261, 184) with width 117 and height 70.
; PLAN: r0=261(x), r1=184(y), r2=117(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 184
LDI r2, 117
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
