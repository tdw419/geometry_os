; DESCRIPTION: Draws a cyan rectangle at (251, 66) with width 72 and height 55.
; PLAN: r0=251(x), r1=66(y), r2=72(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 66
LDI r2, 72
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
