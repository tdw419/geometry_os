; DESCRIPTION: Places a white 68x21 rectangle at position (158, 131).
; PLAN: r0=158(x), r1=131(y), r2=68(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 131
LDI r2, 68
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
