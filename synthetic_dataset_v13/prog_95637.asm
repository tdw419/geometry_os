; DESCRIPTION: Places a red 101x28 rectangle at position (396, 31).
; PLAN: r0=396(x), r1=31(y), r2=101(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 31
LDI r2, 101
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
