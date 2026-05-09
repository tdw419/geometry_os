; DESCRIPTION: Draws a cyan rectangle at (307, 123) with width 85 and height 79.
; PLAN: r0=307(x), r1=123(y), r2=85(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 123
LDI r2, 85
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
