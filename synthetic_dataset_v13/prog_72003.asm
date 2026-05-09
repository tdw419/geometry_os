; DESCRIPTION: Places a white 89x55 rectangle at position (321, 139).
; PLAN: r0=321(x), r1=139(y), r2=89(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 139
LDI r2, 89
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
