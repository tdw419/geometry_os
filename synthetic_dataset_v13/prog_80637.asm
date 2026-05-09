; DESCRIPTION: Places a green 15x100 rectangle at position (57, 61).
; PLAN: r0=57(x), r1=61(y), r2=15(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 61
LDI r2, 15
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
