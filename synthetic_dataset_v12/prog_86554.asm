; DESCRIPTION: Draws a green rectangle at (146, 10) with width 88 and height 117.
; PLAN: r0=146(x), r1=10(y), r2=88(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 10
LDI r2, 88
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
