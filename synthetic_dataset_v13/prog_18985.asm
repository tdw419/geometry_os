; DESCRIPTION: Places a yellow 93x107 rectangle at position (52, 26).
; PLAN: r0=52(x), r1=26(y), r2=93(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 26
LDI r2, 93
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
