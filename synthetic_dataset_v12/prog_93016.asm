; DESCRIPTION: Draws a yellow rectangle at (196, 202) with width 115 and height 34.
; PLAN: r0=196(x), r1=202(y), r2=115(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 202
LDI r2, 115
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
