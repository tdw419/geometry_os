; DESCRIPTION: Places a yellow 31x101 rectangle at position (71, 44).
; PLAN: r0=71(x), r1=44(y), r2=31(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 44
LDI r2, 31
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
