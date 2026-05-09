; DESCRIPTION: Places a green 115x62 rectangle at position (333, 37).
; PLAN: r0=333(x), r1=37(y), r2=115(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 37
LDI r2, 115
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
