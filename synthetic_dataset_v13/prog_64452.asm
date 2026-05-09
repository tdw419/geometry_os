; DESCRIPTION: Draws a cyan rectangle at (225, 55) with width 46 and height 77.
; PLAN: r0=225(x), r1=55(y), r2=46(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 55
LDI r2, 46
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
