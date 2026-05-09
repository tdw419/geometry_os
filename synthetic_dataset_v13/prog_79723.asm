; DESCRIPTION: Places a green 32x118 rectangle at position (91, 61).
; PLAN: r0=91(x), r1=61(y), r2=32(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 61
LDI r2, 32
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
