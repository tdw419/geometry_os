; DESCRIPTION: Draws a green rectangle at (231, 61) with width 46 and height 68.
; PLAN: r0=231(x), r1=61(y), r2=46(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 61
LDI r2, 46
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
