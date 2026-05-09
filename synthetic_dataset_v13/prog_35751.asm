; DESCRIPTION: Places a blue 101x28 rectangle at position (61, 179).
; PLAN: r0=61(x), r1=179(y), r2=101(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 179
LDI r2, 101
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
