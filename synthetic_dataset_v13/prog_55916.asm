; DESCRIPTION: Places a green 53x13 rectangle at position (25, 10).
; PLAN: r0=25(x), r1=10(y), r2=53(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 10
LDI r2, 53
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
