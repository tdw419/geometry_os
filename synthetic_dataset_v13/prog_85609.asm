; DESCRIPTION: Places a green 57x63 rectangle at position (6, 13).
; PLAN: r0=6(x), r1=13(y), r2=57(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 13
LDI r2, 57
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
