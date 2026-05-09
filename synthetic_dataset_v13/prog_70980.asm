; DESCRIPTION: Draws a red rectangle at (231, 95) with width 46 and height 84.
; PLAN: r0=231(x), r1=95(y), r2=46(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 95
LDI r2, 46
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
