; DESCRIPTION: Places a green 86x57 rectangle at position (34, 32).
; PLAN: r0=34(x), r1=32(y), r2=86(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 32
LDI r2, 86
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
