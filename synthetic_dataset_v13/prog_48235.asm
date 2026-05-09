; DESCRIPTION: Places a red 89x112 rectangle at position (258, 31).
; PLAN: r0=258(x), r1=31(y), r2=89(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 31
LDI r2, 89
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
