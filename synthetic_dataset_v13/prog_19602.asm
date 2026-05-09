; DESCRIPTION: Places a green 32x60 rectangle at position (118, 66).
; PLAN: r0=118(x), r1=66(y), r2=32(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 66
LDI r2, 32
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
