; DESCRIPTION: Places a green 35x93 rectangle at position (283, 63).
; PLAN: r0=283(x), r1=63(y), r2=35(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 63
LDI r2, 35
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
