; DESCRIPTION: Places a green 53x49 rectangle at position (406, 93).
; PLAN: r0=406(x), r1=93(y), r2=53(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 93
LDI r2, 53
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
