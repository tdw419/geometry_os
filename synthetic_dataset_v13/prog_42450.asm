; DESCRIPTION: Draws a green rectangle at (75, 27) with width 45 and height 31.
; PLAN: r0=75(x), r1=27(y), r2=45(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 27
LDI r2, 45
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
