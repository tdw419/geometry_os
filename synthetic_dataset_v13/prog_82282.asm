; DESCRIPTION: Places a orange 83x61 rectangle at position (396, 93).
; PLAN: r0=396(x), r1=93(y), r2=83(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 93
LDI r2, 83
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
