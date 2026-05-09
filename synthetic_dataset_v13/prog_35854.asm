; DESCRIPTION: Draws a cyan rectangle at (149, 113) with width 29 and height 79.
; PLAN: r0=149(x), r1=113(y), r2=29(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 113
LDI r2, 29
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
