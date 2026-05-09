; DESCRIPTION: Draws a red rectangle at (132, 207) with width 13 and height 40.
; PLAN: r0=132(x), r1=207(y), r2=13(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 207
LDI r2, 13
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
