; DESCRIPTION: Places a red 101x107 rectangle at position (44, 2).
; PLAN: r0=44(x), r1=2(y), r2=101(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 2
LDI r2, 101
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
