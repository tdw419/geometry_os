; DESCRIPTION: Draws a cyan rectangle at (75, 172) with width 35 and height 60.
; PLAN: r0=75(x), r1=172(y), r2=35(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 172
LDI r2, 35
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
