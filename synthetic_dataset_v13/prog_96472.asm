; DESCRIPTION: Draws a orange rectangle at (326, 231) with width 92 and height 13.
; PLAN: r0=326(x), r1=231(y), r2=92(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 231
LDI r2, 92
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
