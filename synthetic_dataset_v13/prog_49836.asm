; DESCRIPTION: Draws a cyan rectangle at (113, 108) with width 38 and height 73.
; PLAN: r0=113(x), r1=108(y), r2=38(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 108
LDI r2, 38
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
