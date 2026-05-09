; DESCRIPTION: Draws a red rectangle at (350, 13) with width 23 and height 88.
; PLAN: r0=350(x), r1=13(y), r2=23(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 13
LDI r2, 23
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
