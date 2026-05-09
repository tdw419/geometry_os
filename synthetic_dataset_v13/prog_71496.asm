; DESCRIPTION: Places a green 66x87 rectangle at position (93, 31).
; PLAN: r0=93(x), r1=31(y), r2=66(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 31
LDI r2, 66
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
