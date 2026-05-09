; DESCRIPTION: Places a yellow 87x98 rectangle at position (23, 93).
; PLAN: r0=23(x), r1=93(y), r2=87(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 93
LDI r2, 87
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
