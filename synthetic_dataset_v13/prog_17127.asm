; DESCRIPTION: Places a green 63x83 rectangle at position (52, 16).
; PLAN: r0=52(x), r1=16(y), r2=63(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 16
LDI r2, 63
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
