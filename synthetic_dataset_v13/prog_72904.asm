; DESCRIPTION: Draws a yellow rectangle at (80, 41) with width 75 and height 48.
; PLAN: r0=80(x), r1=41(y), r2=75(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 41
LDI r2, 75
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
