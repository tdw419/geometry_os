; DESCRIPTION: Draws a cyan rectangle at (298, 26) with width 96 and height 95.
; PLAN: r0=298(x), r1=26(y), r2=96(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 26
LDI r2, 96
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
