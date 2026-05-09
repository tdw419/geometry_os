; DESCRIPTION: Draws a cyan rectangle at (206, 141) with width 28 and height 84.
; PLAN: r0=206(x), r1=141(y), r2=28(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 141
LDI r2, 28
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
