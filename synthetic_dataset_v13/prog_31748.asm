; DESCRIPTION: Places a green 97x53 rectangle at position (38, 86).
; PLAN: r0=38(x), r1=86(y), r2=97(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 86
LDI r2, 97
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
