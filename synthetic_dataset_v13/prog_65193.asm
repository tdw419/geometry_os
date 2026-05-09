; DESCRIPTION: Places a white 23x72 rectangle at position (338, 93).
; PLAN: r0=338(x), r1=93(y), r2=23(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 93
LDI r2, 23
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
