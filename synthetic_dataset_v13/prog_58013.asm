; DESCRIPTION: Places a red 62x89 rectangle at position (185, 43).
; PLAN: r0=185(x), r1=43(y), r2=62(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 43
LDI r2, 62
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
