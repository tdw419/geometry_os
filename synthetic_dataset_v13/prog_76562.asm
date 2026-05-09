; DESCRIPTION: Draws a cyan rectangle at (75, 88) with width 44 and height 113.
; PLAN: r0=75(x), r1=88(y), r2=44(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 88
LDI r2, 44
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
