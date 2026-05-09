; DESCRIPTION: Places a red 12x93 rectangle at position (85, 9).
; PLAN: r0=85(x), r1=9(y), r2=12(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 9
LDI r2, 12
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
