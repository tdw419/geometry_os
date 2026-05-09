; DESCRIPTION: Places a yellow 31x38 rectangle at position (115, 101).
; PLAN: r0=115(x), r1=101(y), r2=31(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 101
LDI r2, 31
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
