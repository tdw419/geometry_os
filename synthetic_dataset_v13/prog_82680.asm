; DESCRIPTION: Places a red 119x30 rectangle at position (223, 139).
; PLAN: r0=223(x), r1=139(y), r2=119(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 139
LDI r2, 119
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
