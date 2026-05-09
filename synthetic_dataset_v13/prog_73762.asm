; DESCRIPTION: Draws a green rectangle at (174, 70) with width 10 and height 100.
; PLAN: r0=174(x), r1=70(y), r2=10(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 70
LDI r2, 10
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
