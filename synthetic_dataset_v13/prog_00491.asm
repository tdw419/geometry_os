; DESCRIPTION: Draws a orange rectangle at (94, 58) with width 73 and height 22.
; PLAN: r0=94(x), r1=58(y), r2=73(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 58
LDI r2, 73
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
