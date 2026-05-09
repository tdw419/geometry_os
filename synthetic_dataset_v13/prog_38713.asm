; DESCRIPTION: Draws a cyan rectangle at (380, 2) with width 119 and height 95.
; PLAN: r0=380(x), r1=2(y), r2=119(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 2
LDI r2, 119
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
