; DESCRIPTION: Draws a cyan rectangle at (126, 100) with width 79 and height 45.
; PLAN: r0=126(x), r1=100(y), r2=79(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 100
LDI r2, 79
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
