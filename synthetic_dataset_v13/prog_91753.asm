; DESCRIPTION: Places a yellow 12x83 rectangle at position (339, 87).
; PLAN: r0=339(x), r1=87(y), r2=12(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 87
LDI r2, 12
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
