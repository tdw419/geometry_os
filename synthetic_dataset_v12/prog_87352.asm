; DESCRIPTION: Places a orange 31x83 rectangle at position (345, 142).
; PLAN: r0=345(x), r1=142(y), r2=31(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 142
LDI r2, 31
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
