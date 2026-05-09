; DESCRIPTION: Draws a yellow rectangle at (160, 90) with width 60 and height 117.
; PLAN: r0=160(x), r1=90(y), r2=60(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 90
LDI r2, 60
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
