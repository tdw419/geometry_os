; DESCRIPTION: Creates a yellow rectangular region at (231, 69) spanning 85 by 43 pixels.
; PLAN: r0=231(x), r1=69(y), r2=85(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 69
LDI r2, 85
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
