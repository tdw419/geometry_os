; DESCRIPTION: Places a white 101x107 rectangle at position (99, 13).
; PLAN: r0=99(x), r1=13(y), r2=101(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 13
LDI r2, 101
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
