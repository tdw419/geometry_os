; DESCRIPTION: Places a blue 34x66 rectangle at position (189, 93).
; PLAN: r0=189(x), r1=93(y), r2=34(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 93
LDI r2, 34
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
