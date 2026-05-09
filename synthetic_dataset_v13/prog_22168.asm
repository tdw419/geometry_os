; DESCRIPTION: Places a red 57x89 rectangle at position (283, 93).
; PLAN: r0=283(x), r1=93(y), r2=57(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 93
LDI r2, 57
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
