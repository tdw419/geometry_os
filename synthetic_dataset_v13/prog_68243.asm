; DESCRIPTION: Draws a black rectangle at (150, 178) with width 21 and height 54.
; PLAN: r0=150(x), r1=178(y), r2=21(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 178
LDI r2, 21
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
