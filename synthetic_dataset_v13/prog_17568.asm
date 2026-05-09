; DESCRIPTION: Draws a cyan rectangle at (182, 58) with width 119 and height 105.
; PLAN: r0=182(x), r1=58(y), r2=119(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 58
LDI r2, 119
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
