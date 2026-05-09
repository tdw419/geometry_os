; DESCRIPTION: Draws a cyan rectangle at (240, 25) with width 76 and height 38.
; PLAN: r0=240(x), r1=25(y), r2=76(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 25
LDI r2, 76
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
