; DESCRIPTION: Places a yellow 75x82 rectangle at position (89, 139).
; PLAN: r0=89(x), r1=139(y), r2=75(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 139
LDI r2, 75
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
