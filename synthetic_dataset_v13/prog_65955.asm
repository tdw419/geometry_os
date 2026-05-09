; DESCRIPTION: Places a white 61x66 rectangle at position (158, 101).
; PLAN: r0=158(x), r1=101(y), r2=61(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 101
LDI r2, 61
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
