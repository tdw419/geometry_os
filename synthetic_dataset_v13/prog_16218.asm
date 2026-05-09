; DESCRIPTION: Draws a cyan rectangle at (179, 38) with width 55 and height 46.
; PLAN: r0=179(x), r1=38(y), r2=55(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 38
LDI r2, 55
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
