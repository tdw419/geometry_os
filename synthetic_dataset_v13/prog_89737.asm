; DESCRIPTION: Draws a green rectangle at (23, 150) with width 25 and height 58.
; PLAN: r0=23(x), r1=150(y), r2=25(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 150
LDI r2, 25
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
