; DESCRIPTION: Places a blue 66x68 rectangle at position (333, 115).
; PLAN: r0=333(x), r1=115(y), r2=66(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 115
LDI r2, 66
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
