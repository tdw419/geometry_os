; DESCRIPTION: Places a green 100x30 rectangle at position (133, 34).
; PLAN: r0=133(x), r1=34(y), r2=100(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 34
LDI r2, 100
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
