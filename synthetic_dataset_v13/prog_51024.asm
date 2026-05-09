; DESCRIPTION: Places a green 38x83 rectangle at position (326, 35).
; PLAN: r0=326(x), r1=35(y), r2=38(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 35
LDI r2, 38
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
