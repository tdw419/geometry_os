; DESCRIPTION: Places a red 78x80 rectangle at position (49, 32).
; PLAN: r0=49(x), r1=32(y), r2=78(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 32
LDI r2, 78
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
