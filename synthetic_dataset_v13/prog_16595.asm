; DESCRIPTION: Places a green 11x85 rectangle at position (86, 136).
; PLAN: r0=86(x), r1=136(y), r2=11(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 136
LDI r2, 11
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
