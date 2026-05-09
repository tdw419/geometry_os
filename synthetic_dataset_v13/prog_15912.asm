; DESCRIPTION: Places a red 57x85 rectangle at position (77, 62).
; PLAN: r0=77(x), r1=62(y), r2=57(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 62
LDI r2, 57
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
