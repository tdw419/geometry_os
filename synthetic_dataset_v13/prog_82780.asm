; DESCRIPTION: Draws a cyan rectangle at (212, 115) with width 104 and height 52.
; PLAN: r0=212(x), r1=115(y), r2=104(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 115
LDI r2, 104
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
