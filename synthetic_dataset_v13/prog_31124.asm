; DESCRIPTION: Draws a green rectangle at (85, 70) with width 27 and height 40.
; PLAN: r0=85(x), r1=70(y), r2=27(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 70
LDI r2, 27
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
