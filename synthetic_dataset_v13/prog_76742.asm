; DESCRIPTION: Draws a cyan rectangle at (176, 149) with width 19 and height 68.
; PLAN: r0=176(x), r1=149(y), r2=19(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 149
LDI r2, 19
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
