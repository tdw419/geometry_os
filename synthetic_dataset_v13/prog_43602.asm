; DESCRIPTION: Draws a cyan rectangle at (138, 121) with width 38 and height 87.
; PLAN: r0=138(x), r1=121(y), r2=38(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 121
LDI r2, 38
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
