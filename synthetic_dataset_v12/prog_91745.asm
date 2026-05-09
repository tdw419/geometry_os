; DESCRIPTION: Places a green 66x26 rectangle at position (299, 39).
; PLAN: r0=299(x), r1=39(y), r2=66(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 39
LDI r2, 66
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
