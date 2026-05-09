; DESCRIPTION: Places a green 115x98 rectangle at position (345, 14).
; PLAN: r0=345(x), r1=14(y), r2=115(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 14
LDI r2, 115
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
