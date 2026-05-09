; DESCRIPTION: Draws a yellow rectangle at (174, 60) with width 54 and height 30.
; PLAN: r0=174(x), r1=60(y), r2=54(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 60
LDI r2, 54
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
