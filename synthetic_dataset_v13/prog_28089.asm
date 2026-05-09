; DESCRIPTION: Places a orange 108x46 rectangle at position (147, 97).
; PLAN: r0=147(x), r1=97(y), r2=108(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 97
LDI r2, 108
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
