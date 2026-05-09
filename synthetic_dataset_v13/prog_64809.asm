; DESCRIPTION: Draws a cyan rectangle at (25, 135) with width 98 and height 65.
; PLAN: r0=25(x), r1=135(y), r2=98(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 135
LDI r2, 98
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
