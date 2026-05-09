; DESCRIPTION: Draws a white rectangle at (231, 102) with width 94 and height 59.
; PLAN: r0=231(x), r1=102(y), r2=94(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 102
LDI r2, 94
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
