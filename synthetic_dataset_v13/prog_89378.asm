; DESCRIPTION: Places a red 93x87 rectangle at position (396, 156).
; PLAN: r0=396(x), r1=156(y), r2=93(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 156
LDI r2, 93
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
