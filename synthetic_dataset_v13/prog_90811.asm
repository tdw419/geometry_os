; DESCRIPTION: Places a green 80x13 rectangle at position (8, 157).
; PLAN: r0=8(x), r1=157(y), r2=80(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 157
LDI r2, 80
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
