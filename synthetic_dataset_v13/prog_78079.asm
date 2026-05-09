; DESCRIPTION: Places a white 93x75 rectangle at position (396, 140).
; PLAN: r0=396(x), r1=140(y), r2=93(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 140
LDI r2, 93
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
