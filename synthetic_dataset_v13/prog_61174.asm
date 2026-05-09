; DESCRIPTION: Places a orange 14x93 rectangle at position (118, 142).
; PLAN: r0=118(x), r1=142(y), r2=14(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 142
LDI r2, 14
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
