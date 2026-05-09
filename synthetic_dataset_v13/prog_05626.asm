; DESCRIPTION: Places a green 57x45 rectangle at position (227, 101).
; PLAN: r0=227(x), r1=101(y), r2=57(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 101
LDI r2, 57
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
