; DESCRIPTION: Places a green 76x93 rectangle at position (122, 144).
; PLAN: r0=122(x), r1=144(y), r2=76(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 144
LDI r2, 76
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
