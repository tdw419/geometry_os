; DESCRIPTION: Draws a green rectangle at (196, 11) with width 109 and height 95.
; PLAN: r0=196(x), r1=11(y), r2=109(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 11
LDI r2, 109
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
