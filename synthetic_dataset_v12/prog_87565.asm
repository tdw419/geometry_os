; DESCRIPTION: Places a green 53x34 rectangle at position (231, 83).
; PLAN: r0=231(x), r1=83(y), r2=53(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 83
LDI r2, 53
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
