; DESCRIPTION: Draws a cyan rectangle at (195, 95) with width 101 and height 100.
; PLAN: r0=195(x), r1=95(y), r2=101(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 95
LDI r2, 101
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
