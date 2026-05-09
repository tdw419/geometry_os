; DESCRIPTION: Places a green 108x107 rectangle at position (93, 51).
; PLAN: r0=93(x), r1=51(y), r2=108(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 51
LDI r2, 108
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
