; DESCRIPTION: Places a green 94x58 rectangle at position (326, 115).
; PLAN: r0=326(x), r1=115(y), r2=94(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 115
LDI r2, 94
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
