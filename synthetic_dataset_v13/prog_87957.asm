; DESCRIPTION: Places a orange 93x120 rectangle at position (71, 97).
; PLAN: r0=71(x), r1=97(y), r2=93(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 97
LDI r2, 93
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
