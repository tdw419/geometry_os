; DESCRIPTION: Places a green 76x45 rectangle at position (155, 138).
; PLAN: r0=155(x), r1=138(y), r2=76(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 138
LDI r2, 76
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
