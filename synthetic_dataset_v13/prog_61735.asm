; DESCRIPTION: Draws a cyan rectangle at (325, 75) with width 95 and height 36.
; PLAN: r0=325(x), r1=75(y), r2=95(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 75
LDI r2, 95
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
