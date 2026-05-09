; DESCRIPTION: Places a red 44x93 rectangle at position (6, 23).
; PLAN: r0=6(x), r1=23(y), r2=44(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 23
LDI r2, 44
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
