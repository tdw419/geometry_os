; DESCRIPTION: Draws a cyan rectangle at (75, 181) with width 69 and height 66.
; PLAN: r0=75(x), r1=181(y), r2=69(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 181
LDI r2, 69
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
