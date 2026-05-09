; DESCRIPTION: Draws a red rectangle at (359, 202) with width 19 and height 22.
; PLAN: r0=359(x), r1=202(y), r2=19(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 202
LDI r2, 19
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
