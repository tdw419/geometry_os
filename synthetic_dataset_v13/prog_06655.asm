; DESCRIPTION: Places a red 43x106 rectangle at position (451, 141).
; PLAN: r0=451(x), r1=141(y), r2=43(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 141
LDI r2, 43
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
