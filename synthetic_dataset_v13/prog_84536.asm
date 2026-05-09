; DESCRIPTION: Places a cyan 24x37 rectangle at position (326, 149).
; PLAN: r0=326(x), r1=149(y), r2=24(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 149
LDI r2, 24
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
