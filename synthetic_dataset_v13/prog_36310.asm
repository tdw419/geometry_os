; DESCRIPTION: Places a green 23x64 rectangle at position (8, 61).
; PLAN: r0=8(x), r1=61(y), r2=23(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 61
LDI r2, 23
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
